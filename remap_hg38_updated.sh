#!/bin/bash
#SBATCH --job-name=remap_hg38
#SBATCH --array=1-4
#SBATCH --cpus-per-task=16
#SBATCH --mem=256G
#SBATCH --time=24:00:00
#SBATCH --output=/scratch/prj/mirocalstrial/remap_cyrius/logs/remap_%A_%a.out
#SBATCH --error=/scratch/prj/mirocalstrial/remap_cyrius/logs/remap_%A_%a.err

set -euo pipefail

module load bwa samtools picard

REF=/scratch/prj/mirocalstrial/remap_cyrius/reference/hg38.primary.fa
BAM_LIST=/scratch/prj/mirocalstrial/remap_cyrius/cyrius_results/manifest_batch1.txt
HG38_BAMS=/scratch/prj/mirocalstrial/remap_cyrius/hg38_bams
TMP=/scratch/prj/mirocalstrial/remap_cyrius/scratch_tmp

mkdir -p "$HG38_BAMS" "$TMP"

INPUT_BAM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$BAM_LIST" | tr -d '\r' | xargs)

if [[ -z "$INPUT_BAM" ]]; then
    echo "ERROR: No BAM found for SLURM_ARRAY_TASK_ID=${SLURM_ARRAY_TASK_ID}" >&2
    exit 1
fi

if [[ ! -f "$INPUT_BAM" ]]; then
    echo "ERROR: Input BAM does not exist: $INPUT_BAM" >&2
    exit 1
fi

SAMPLE=$(basename "$INPUT_BAM")
SAMPLE=${SAMPLE%.bam}
SAMPLE=${SAMPLE%.cram}

echo "[$(date)] Processing: $SAMPLE"
echo "[$(date)] Input BAM: $INPUT_BAM"
echo "[$(date)] Reference: $REF"

# ── Reference checks ─────────────────────────────────────────────────────────

if [[ ! -f "$REF" ]]; then
    echo "ERROR: Reference FASTA does not exist: $REF" >&2
    exit 1
fi

if [[ ! -f "${REF}.fai" ]]; then
    echo "[$(date)] Creating FASTA index for $REF"
    samtools faidx "$REF"
fi

if [[ ! -f "${REF}.bwt" ]]; then
    echo "ERROR: BWA index not found for $REF" >&2
    echo "Run: bwa index $REF" >&2
    exit 1
fi

CHR22_LEN=$(awk '$1=="chr22" {print $2}' "${REF}.fai" || true)

if [[ "$CHR22_LEN" != "50818468" ]]; then
    echo "ERROR: Reference does not look like chr-prefixed GRCh38." >&2
    echo "Expected chr22 length: 50818468" >&2
    echo "Observed chr22 length: ${CHR22_LEN:-missing}" >&2
    exit 1
fi

ALT_RANDOM_COUNT=$(awk '$1 ~ /_alt$/ || $1 ~ /_random$/ || $1 ~ /^KI/ || $1 ~ /^GL/ {n++} END {print n+0}' "${REF}.fai")

if [[ "$ALT_RANDOM_COUNT" -gt 0 ]]; then
    echo "WARNING: Reference contains ALT/random/decoy-like contigs: $ALT_RANDOM_COUNT" >&2
    echo "WARNING: For BCyrius troubleshooting, primary-only GRCh38 is preferred." >&2
fi


# ── Step 1: BAM → FASTQ ───────────────────────────────────────────────────────
FQ1=${TMP}/${SAMPLE}_R1.fq.gz
FQ2=${TMP}/${SAMPLE}_R2.fq.gz

picard SamToFastq \
    I="$INPUT_BAM" \
    FASTQ="$FQ1" \
    SECOND_END_FASTQ="$FQ2" \
    VALIDATION_STRINGENCY=SILENT \
    INCLUDE_NON_PF_READS=true \
    INTERLEAVE=false \
    TMP_DIR="$TMP"

echo "[$(date)] FASTQ done: $SAMPLE"

# ── Step 2: Remap to hg38 ─────────────────────────────────────────────────────
REMAPPED=${HG38_BAMS}/${SAMPLE}_hg38.primary.bam

bwa mem -t "$SLURM_CPUS_PER_TASK" \
    -R "@RG\tID:${SAMPLE}\tSM:${SAMPLE}\tPL:ILLUMINA\tLB:${SAMPLE}" \
    "$REF" "$FQ1" "$FQ2" | \
samtools sort -@ "$SLURM_CPUS_PER_TASK" \
    -T "${TMP}/${SAMPLE}" \
    -o "$REMAPPED" \
    -

samtools index -@ "$SLURM_CPUS_PER_TASK" "$REMAPPED"
echo "[$(date)] Remapping done: $SAMPLE"

# ── Step 3: Mark duplicates after remapping ───────────────────────────────────

MARKED=${HG38_BAMS}/${SAMPLE}_hg38.primary.markdup.bam
METRICS=${HG38_BAMS}/${SAMPLE}_hg38.primary.markdup.metrics.txt

picard MarkDuplicates \
    I="$REMAPPED" \
    O="$MARKED" \
    M="$METRICS" \
    CREATE_INDEX=true \
    VALIDATION_STRINGENCY=SILENT \
    TMP_DIR="$TMP"

echo "[$(date)] Duplicate marking done: $SAMPLE"

# ── Step 4: Basic sanity checks for Cyrius/BCyrius ───────────────────────────────────

echo "[$(date)] chr22 contig check:"
samtools idxstats "$MARKED" | awk '$1=="chr22" {print $1, $2, $3, $4}'

echo "[$(date)] CYP2D6/CYP2D7-region mean depth:"
samtools depth -r chr22:42120000-42135000 "$MARKED" \
    | awk '{sum+=$3; n++} END {if (n>0) print "mean_depth", sum/n, "positions", n; else print "no_depth"}'

echo "[$(date)] CYP2D6/CYP2D7-region read count:"
samtools view -c "$MARKED" chr22:42120000-42135000

echo "[$(date)] CYP2D6/CYP2D7-region MAPQ distribution:"
samtools view "$MARKED" chr22:42120000-42135000 \
    | awk '{mq[$5]++} END {for (m in mq) print m, mq[m]}' \
    | sort -n

rm -f "$FQ1" "$FQ2"


echo "[$(date)] Finished: $SAMPLE"
echo "[$(date)] Remapped BAM: $REMAPPED"
echo "[$(date)] Mark-duplicate BAM for Cyrius/BCyrius: $MARKED"

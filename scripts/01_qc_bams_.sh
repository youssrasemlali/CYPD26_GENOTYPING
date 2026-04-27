#!/bin/bash
#SBATCH --job-name=bam_qc
#SBATCH --partition=msc_appbio
#SBATCH --array=1-20
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=0-2:00:00
#SBATCH --output=/scratch/prj/mirocalstrial/remap_cyrius/logs/qc_%A_%a.out
#SBATCH --error=/scratch/prj/mirocalstrial/remap_cyrius/logs/qc_%A_%a.err

module load samtools

BAM_LIST=/scratch/prj/mirocalstrial/remap_cyrius/cyrius_results/manifest.txt
QC_DIR=/scratch/prj/mirocalstrial/remap_cyrius/qc

mkdir -p "$QC_DIR"

INPUT_BAM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$BAM_LIST")
SAMPLE=$(basename "$INPUT_BAM" .bam)

echo "[$(date)] QC for: $SAMPLE"

# Basic alignment stats
samtools flagstat "$INPUT_BAM" > ${QC_DIR}/${SAMPLE}_flagstat.txt

# CYP2D6 region depth
samtools depth -r chr22:42126499-42927829 "$INPUT_BAM" | \
    awk '{sum+=$3; count++} END {print "CYP2D6 region mean depth:", sum/count}' \
    > ${QC_DIR}/${SAMPLE}_cyp2d6_depth.txt

# CYP2D6 region mapQ
samtools view "$INPUT_BAM" chr22:42126499-42927829 | \
    awk '{mapq+=$5; count++} END {
        print "Mean mapQ in CYP2D6 region:", mapq/count;
        print "Total reads in region:", count
    }' >> ${QC_DIR}/${SAMPLE}_cyp2d6_depth.txt

echo "[$(date)] QC done: $SAMPLE"

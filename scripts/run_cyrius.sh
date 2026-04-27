#!/bin/bash
#SBATCH --job-name=cyrius_cyp2d6
#SBATCH --partition=msc_appbio
#SBATCH --array=1-20
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=0-4:00:00
#SBATCH --output=/scratch/prj/mirocalstrial/remap_cyrius/logs/cyrius_%A_%a.out
#SBATCH --error=/scratch/prj/mirocalstrial/remap_cyrius/logs/cyrius_%A_%a.err

# Run using conda environment
source $(conda info --base)/etc/profile.d/conda.sh
conda activate cyrius_env

BAM_LIST=/scratch/prj/mirocalstrial/remap_cyrius/cyrius_results/manifest.txt
OUT_DIR=/scratch/prj/mirocalstrial/remap_cyrius/cyrius_results

INPUT_BAM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$BAM_LIST")
SAMPLE=$(basename "$INPUT_BAM" .bam)

echo "[$(date)] Running Cyrius on: $SAMPLE"
echo "$INPUT_BAM" > ${OUT_DIR}/${SAMPLE}_manifest.txt

cyrius --manifest ${OUT_DIR}/${SAMPLE}_manifest.txt \
       --genome 19 \
       --prefix "$SAMPLE" \
       --outDir "$OUT_DIR" \
       --threads "$SLURM_CPUS_PER_TASK"

echo "[$(date)] Done: $SAMPLE"

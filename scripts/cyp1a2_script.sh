#!/bin/bash
#SBATCH --job-name=aldy_cyp1a2
#SBATCH --partition=msc_appbio
#SBATCH --array=1-20
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=0-2:00:00
#SBATCH --output=/scratch/users/k25048592/cyp1a2_aldy/logs/aldy_%A_%a.out
#SBATCH --error=/scratch/users/k25048592/cyp1a2_aldy/logs/aldy_%A_%a.err

source $(conda info --base)/etc/profile.d/conda.sh
conda activate aldy

MANIFEST=/scratch/users/k25048592/cyp1a2_aldy/manifest.txt
OUT_DIR=/scratch/users/k25048592/cyp1a2_aldy/results

INPUT_BAM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$MANIFEST")
SAMPLE=$(basename "$INPUT_BAM" _hg38.primary.bam)

echo "[$(date)] Running Aldy CYP1A2 on: $SAMPLE"

aldy genotype \
    -g CYP1A2 \
    -p illumina \
    --genome hg38 \
    -o ${OUT_DIR}/${SAMPLE}_CYP1A2.aldy \
    "$INPUT_BAM"

echo "[$(date)] Done: $SAMPLE"
EOF
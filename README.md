# CYP2D6 genetic variation in Middle Eastern Patients with amyotrophic lateral sclerosis:  an association study of disease risk, survival and comparative population genetics

---

##  Project Overview

CYP2D6 is a highly polymorphic drug-metabolising enzyme, expressed in the brain, where
it is implicated in the clearance of neuroactive compounds and environmental
neurotoxins. Reduced CYP2D6 activity has been linked to increased risk of
neurodegenerative disease, and — in the largest CYP2D6/ALS study to date
(Vallikivi et al., 2025, *Brain*; >6,000 individuals across European Project MinE
cohorts) — reduced CYP2D6 activity was associated with increased ALS risk, while
poor metabolisers taking riluzole survived significantly longer.

CYP2D6 allele frequencies are known to differ substantially by ancestry, and
population genomic databases remain overwhelmingly European. **No CYP2D6
pharmacogenomic data has previously existed for a Middle Eastern ALS cohort.**

This project characterises CYP2D6 (and, for the Kuwait cohort, CYP1A2 — the primary
metaboliser of riluzole) in **Turkish and Kuwaiti** ALS cohorts from Project MinE, and
compares CYP2D6 metaboliser-phenotype associations with ALS risk and survival against
the published European reference cohorts.

| Cohort | n | Design | Contributes to |
|---|---|---|---|
| **Turkey** | 601 ALS cases, 144 controls | Case-control + survival (26 deaths, 590 with follow-up) | Risk analysis, survival analysis, riluzole subset, allele frequencies |
| **Kuwait** | 20 samples (18 after QC) | ALS cases only, no controls | Baseline characterisation, allele/genotype frequencies, CYP1A2 genotyping |

### Key Analyses

- CYP2D6 star-allele calling from WGS: **Cyrius** (Turkey and Kuwait, hg19 BAMs) and **BCyrius**
  (Kuwait, remapped to hg38)
- CYP1A2 star-allele calling: **Aldy v4.8.3** (Kuwait)
- Multivariable logistic regression — CYP2D6 metaboliser phenotype and ALS risk
  (Turkey case-control)
- Multivariable Cox regression — CYP2D6 metaboliser phenotype and ALS survival,
  including a confirmed-riluzole-user subgroup (Turkey)
- Kaplan-Meier survival curves by metaboliser phenotype
- CYP2D6/CYP1A2 allele and genotype frequency characterisation (both cohorts)
- Cross-cohort comparison of risk/survival estimates against published UK, France,
  and Pooled European cohort data (Vallikivi et al., 2025), including pooled-estimate figures

---

## Repository Structure

```
├── scripts/
│   ├── 01_qc_bams.sh                          # BAM QC pre-genotyping (Turkey)
│   ├── 02_run_cyrius.sh                       # CYP2D6 calling, hg19 (Turkey)
│   ├── 03_remap_hg38_kuwait.sh                # Remap + markdup to hg38 (Kuwait)
│   ├── 04_run_bcyrius_kuwait.sh               # CYP2D6 calling, hg38 (Kuwait)
│   ├── 05_run_cyp1a2_aldy.sh                  # CYP1A2 calling (Kuwait)
│   ├── 06_cyp1a2_genotype_summary.qmd         # CYP1A2 genotype/allele plots + table
│   ├── 07_risk_analysis_turkey.qmd            # Logistic regression — ALS risk
│   ├── 08_survival_analysis_turkey.qmd        # Cox regression + KM curves — survival
│   ├── 09_riluzole_subset_analysis.qmd        # Riluzole-user subgroup KM curves
│   ├── 10_kuwait_baseline_characteristics.qmd # Kuwait baseline table
│   ├── 11_cyp2d6_allele_lollipop_plot.r       # CYP2D6 allele frequency, both cohorts
│   └── 12_publication_figures_cross_cohort.r  # Final figures Turkey vs UK/France/Pooled European
│
├── results/
│   ├── tables/                  # Comparison tables
│   └── plots/                   # Forest plots, KM curves, allele frequency plots
│
├── .gitignore
└── README.md
```

### Where to find things

| Looking for... | Go to |
|---|---|
| CYP2D6 genotyping pipeline (BAM → star alleles) | `scripts/01`–`04` |
| CYP1A2 genotyping pipeline | `scripts/05`–`06` |
| ALS risk analysis (Turkey) | `scripts/07_risk_analysis_turkey.qmd` |
| ALS survival analysis (Turkey) | `scripts/08_survival_analysis_turkey.qmd` |
| Riluzole subgroup analysis | `scripts/09_riluzole_subset_analysis.qmd` |
| Kuwait cohort baseline characteristics | `scripts/10_kuwait_baseline_characteristics.qmd` |
| CYP2D6 allele frequency plots (both cohorts) | `scripts/11_cyp2d6_allele_lollipop_plot.r` |
| Cross-cohort comparison vs published European data | `scripts/12_publication_figures_cross_cohort.r` |
| Expected data file structure | `data/README.md` |
| Generated tables  | `results/tables/` |
| Generated figures | `results/plots/` |

---

## Pipeline / Run Order

The genotyping scripts (SLURM batch jobs, run on an HPC cluster) and the analysis
scripts (Quarto/R, typically run interactively or rendered locally) are separate
stages:

**1. Genotyping (HPC, SLURM)**
```bash
sbatch scripts/01_qc_bams.sh              # Turkey — BAM QC
sbatch scripts/02_run_cyrius.sh           # Turkey — CYP2D6 (Cyrius, hg19)
sbatch scripts/03_remap_hg38_kuwait.sh    # Kuwait — remap to hg38 (run per batch)
sbatch scripts/04_run_bcyrius_kuwait.sh   # Kuwait — CYP2D6 (BCyrius, hg38)
sbatch scripts/05_run_cyp1a2_aldy.sh      # Kuwait — CYP1A2 (Aldy)
```

**2. Analysis (R / Quarto)**

Run in numeric order — later scripts depend on objects created earlier in the same
R session (e.g. `08` creates `df_survival`, which `09` and `11` build on):

```r
# render or source in order:
06_cyp1a2_genotype_summary.qmd
07_risk_analysis_turkey.qmd
08_survival_analysis_turkey.qmd
09_riluzole_subset_analysis.qmd
10_kuwait_baseline_characteristics.qmd
11_cyp2d6_allele_lollipop_plot.r
12_publication_figures_cross_cohort.r
```

---

## Reproducibility Notes

- Analyses were run using **King's College London's CREATE HPC cluster** (FastQC, CYP2D6 genotyping (Cyrius + BCyrius, remapping, CYP1A2 genotyping (Aldy) and local R environments (cleaning, risk, survival and visualisations).

---

## Data Availability

Clinical data used in this study are from **Project MinE**, subject to
institutional data-sharing agreements, and are not included in this repository.

---

## Declaration

This dissertation is submitted in partial fulfilment of the requirements for the
degree of MSc Applied Bioinformatics at King's College London. This is the author's
own work; sources have been properly acknowledged and referenced throughout.

## Acknowledgements

With thanks to the Project MinE ALS Sequencing Consortium for data access, and to
King's College London's Applied Bioinformatics MSc programme.

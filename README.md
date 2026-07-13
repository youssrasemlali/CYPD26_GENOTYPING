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
| **Turkey** | 601 ALS cases, 144 controls | Case-control + survival (26 deaths, 590 with follow-up) | Baseline characterisation, Risk analysis, survival analysis, riluzole subset, allele frequencies |
| **Kuwait** | 20 samples (18 after QC) | ALS cases only, no controls | Baseline characterisation, allele frequencies, CYP1A2 genotyping |

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
│   ├── 01_qc_bams.sh                          # BAM QC pre-genotyping (Kuwait)
│   ├── 02_cyrius_script.sh                    # CYP2D6 calling, hg19 (Turkey and Kuwait)
│   ├── 03_remap_hg38_kuwait.sh                # Remap + markdup to hg38 (Kuwait)
│   ├── 04_bcyrius_script.sh                   # CYP2D6 calling, hg38 (Kuwait)
│   ├── 05_cyp1a2_script.sh                    # CYP1A2 calling (Kuwait)
│   ├── 06_cleaning_script.qmd                 # Cleaning data according to SOP
│   ├── 07_turkey_baseline.qmd                 # Turkey baseline table
│   ├── 08_kuwait_baseline.qmd                 # Kuwait baseline table
│   ├── 09_cyp1a2_genotyping.qmd               # CYP1A2 genotype/allele plots + table (Kuwait)
│   ├── 10_lollipop_plot_cyp2d6.r              # CYP2D6 allele frequency plots (both cohorts)
│   ├── 11_chisq_cohort_comparison.qmd         # Chi-squared phenotype comparison, Turkey vs Europe
│   ├── 12_risk_analysis_turkey.qmd            # Logistic regression — ALS risk (Turkey)
│   ├── 13_survival_analysis.qmd               # Cox regression + KM curves — survival (Turkey)
│   ├── 14_riluzole_subset_analysis.qmd        # Riluzole-user subgroup KM curves (Turkey)
│   ├── 15_diagnostic_delay.qmd                # Diagnostic delay analysis (Kuwait)
│   └── 16_publication_figures_cross_cohort.r  # Final figures — Turkey vs UK/France/pooled European
│
├── results/
│   ├── tables/                  # Comparison tables
│   └── plots/                   # Forest plots, KM curves, allele frequency plots
│
└── README.md
```
---

## Reproducibility Notes

- Analyses were run using **King's College London's CREATE HPC cluster** (FastQC, CYP2D6 genotyping (Cyrius + BCyrius, remapping, CYP1A2 genotyping (Aldy) and local R environments (cleaning, risk, survival and visualisations).

---

## Data Availability

Raw sequencing and clinical metadata used in this study are from **Project MinE**, subject to
institutional data-sharing agreements, and are not included in this repository.

---

## Declaration

This dissertation is submitted in partial fulfilment of the requirements for the
degree of MSc Applied Bioinformatics at King's College London. This is the author's
own work; sources have been properly acknowledged and referenced throughout.

## Acknowledgements

With thanks to the Project MinE ALS Sequencing Consortium for data access, and to
King's College London's Applied Bioinformatics MSc programme.

# =============================================================================
# COMPLETE ANALYSIS SCRIPT
# CYP2D6 metaboliser phenotype and ALS — Turkey and Kuwait cohorts
# All tables and figures
# =============================================================================
# Required packages
library(kableExtra)
library(dplyr)
library(ggplot2)
library(scales)
library(patchwork)
library(ggtext)
library(forestplot)
library(grid)
library(survival)
library(survminer)

setwd("/Users/youssrasemlali/Desktop/RESEARCH PROJECT/scripts")

# =============================================================================
# TABLE 1: BASELINE CHARACTERISTICS — TURKEY COHORT
# =============================================================================
baseline_turkey <- data.frame(
  Characteristic = c(
    "n",
    "Age, mean (SD)",
    "Male sex, % (n)",
    "Site of onset, % (n)",
    "  Spinal",
    "  Bulbar",
    "  Generalised",
    "  FTD",
    "  Unknown",
    "CYP2D6 *4 allele frequency",
    "Poor metaboliser (PM), %",
    "Intermediate metaboliser (IM), %",
    "Normal metaboliser (NM), %",
    "Ultrarapid metaboliser (UM), %"
  ),
  ALS = c(
    "601",
    "51.9 (14.2)",
    "59.9% (360)",
    "",
    "70.7% (425)",
    "21.3% (128)",
    "5.8% (35)",
    "0.3% (2)",
    "1.8% (11)",
    "0.14",
    "3.3%", "31.1%", "61.2%", "4.3%"
  ),
  Control = c(
    "144",
    "53.2 (17.1)",
    "45.8% (66)",
    "",
    "NA", "NA", "NA", "NA", "NA",
    "0.19",
    "2.8%", "32.6%", "61.8%", "2.8%"
  )
)

table1_html <- baseline_turkey %>%
  kbl(
    col.names = c("Characteristic", "ALS (n = 601)", "Control (n = 144)"),
    align     = c("l", "c", "c"),
    caption   = "Table 1. Baseline characteristics of ALS cases and controls in Turkey cohort"
  ) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria") %>%
  column_spec(1, width = "12cm") %>%
  column_spec(2, width = "4cm") %>%
  column_spec(3, width = "4cm") %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(1, bold = TRUE, background = "#f5f5f5") %>%
  pack_rows("Demographics", 2, 3) %>%
  pack_rows("Clinical", 4, 9) %>%
  pack_rows("CYP2D6 Genotype", 10, 10) %>%
  pack_rows("CYP2D6 Metaboliser Phenotype", 11, 14) %>%
  kableExtra::footnote(
    general = c(
      "SD - standard deviation.",
      "Site of onset not recorded for controls.",
      "CYP2D6 *4 allele frequency estimated from genotype data.",
      "PM - poor metaboliser, IM - intermediate metaboliser, NM - normal metaboliser, UM - ultrarapid metaboliser."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table1_html, "table_baseline_Turkey.html")
cat("Saved: table_baseline_Turkey.html\n")

# =============================================================================
# TABLE 2: BASELINE CHARACTERISTICS — KUWAIT COHORT
# =============================================================================
baseline_kuwait <- data.frame(
  Characteristic = c(
    "n",
    "Age at blood draw, mean (SD)",
    "Age at onset, mean (SD)",
    "Male sex, % (n)",
    "Site of onset, % (n)",
    "  Spinal",
    "  Bulbar",
    "  Flail leg",
    "CYP2D6 *4 allele frequency",
    "Intermediate metaboliser (IM), %",
    "Normal metaboliser (NM), %",
    "Poor metaboliser (PM), %",
    "Ultrarapid metaboliser (UM), %"
  ),
  ALS = c(
    "18",
    "58.3 (13.6)",
    "52.2 (14.1)",
    "60.0% (12)",
    "",
    "75.0% (15)",
    "20.0% (4)",
    "5.0% (1)",
    "0.025",
    "33.3% (6)",
    "66.7% (12)",
    "0.0% (0)",
    "0.0% (0)"
  )
)

table2_html <- baseline_kuwait %>%
  kbl(
    col.names = c("Characteristic", "ALS (n = 18)"),
    align     = c("l", "c"),
    caption   = "Table 2. Baseline characteristics of ALS cases - Kuwait cohort"
  ) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria") %>%
  column_spec(1, width = "12cm") %>%
  column_spec(2, width = "4cm") %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(1, bold = TRUE, background = "#f5f5f5") %>%
  pack_rows("Demographics", 2, 4) %>%
  pack_rows("Clinical", 5, 8) %>%
  pack_rows("CYP2D6 Genotype", 9, 9) %>%
  pack_rows("CYP2D6 Metaboliser Phenotype", 10, 13) %>%
  kableExtra::footnote(
    general = c(
      "SD - standard deviation.",
      "2 samples with unresolved CYP2D6 phenotype excluded from analysis.",
      "CYP2D6 *4 allele frequency estimated from genotype data.",
      "PM - poor metaboliser, IM - intermediate metaboliser, NM - normal metaboliser, UM - ultrarapid metaboliser.",
      "Age at onset missing for 1 sample."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table2_html, "table_baseline_Kuwait.html")
cat("Saved: table_baseline_Kuwait.html\n")

# =============================================================================
# TABLE 3: BASELINE CHARACTERISTICS — UK AND FRANCE COHORTS
# =============================================================================
baseline_uk_france <- data.frame(
  Characteristic = c(
    "n",
    "Age at blood draw, mean",
    "Male sex, %",
    "CYP2D6 *4 allele frequency",
    "Poor metaboliser (PM), %",
    "Intermediate metaboliser (IM), %",
    "Normal metaboliser (NM), %",
    "Ultrarapid metaboliser (UM), %"
  ),
  UK_ALS     = c("1219", "62.4", "61.9%", "0.20", "7.1%", "40.9%", "50.5%", "1.6%"),
  UK_Control = c("380",  "60.1", "38.7%", "0.18", "6.6%", "37.9%", "53.4%", "2.1%"),
  FR_ALS     = c("243",  "65.6", "58.9%", "0.17", "6.2%", "35.0%", "55.1%", "3.7%"),
  FR_Control = c("38",   "63.2", "47.4%", "0.12", "5.3%", "23.7%", "68.4%", "2.6%")
)

table3_html <- baseline_uk_france %>%
  kbl(
    col.names = c("Characteristic",
                  "ALS (n = 1219)", "Control (n = 380)",
                  "ALS (n = 243)",  "Control (n = 38)"),
    align   = c("l", "c", "c", "c", "c"),
    caption = "Table 3. Baseline characteristics of ALS cases and controls - UK and France cohorts"
  ) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria") %>%
  column_spec(1, width = "10cm") %>%
  column_spec(2, width = "3.5cm") %>%
  column_spec(3, width = "3.5cm") %>%
  column_spec(4, width = "3.5cm") %>%
  column_spec(5, width = "3.5cm") %>%
  add_header_above(c(" " = 1, "UK" = 2, "France" = 2)) %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(1, bold = TRUE, background = "#f5f5f5") %>%
  pack_rows("Demographics", 2, 3) %>%
  pack_rows("CYP2D6 Genotype", 4, 4) %>%
  pack_rows("CYP2D6 Metaboliser Phenotype", 5, 8) %>%
  kableExtra::footnote(
    general = c(
      "CYP2D6 *4 allele frequency estimated from genotype data.",
      "PM - poor metaboliser, IM - intermediate metaboliser, NM - normal metaboliser, UM - ultrarapid metaboliser.",
      "Age at blood draw."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table3_html, "table_baseline_UK_France.html")
cat("Saved: table_baseline_UK_France.html\n")

# =============================================================================
# TABLE 4: RISK RESULTS — TURKEY, UK, FRANCE + POOLED EUROPEAN
# =============================================================================
risk_table <- data.frame(
  Cohort  = c("Turkey", "UK", "France", "Pooled (logistic regression)"),
  ALS     = c(601, 1211, 239, 4140),
  Control = c(144, 380, 38, 1812),
  n1      = c(745, 1591, 277, 5952),
  OR1     = c("1.05 (0.72 - 1.53)", "1.17 (0.92 - 1.49)", "1.80 (0.80 - 4.05)", "1.18 (1.06 - 1.33)"),
  p1      = c("0.96", "0.42", "0.42", "0.01*"),
  n2      = c(715, 924, 174, 3381),
  OR2     = c("1.01 (0.68 - 1.49)", "1.30 (0.79 - 2.13)", "1.75 (0.31 - 9.83)", "1.21 (0.96 - 1.54)"),
  p2      = c("0.96", "0.55", "0.64", "0.14"),
  n3      = c(691, 1453, 252, 5439),
  OR3     = c("0.98 (0.66 - 1.47)", "1.19 (0.92 - 1.54)", "2.20 (0.86 - 5.58)", "1.18 (1.05 - 1.33)"),
  p3      = c("0.96", "0.42", "0.38", "0.01*"),
  n4      = c(481, 840, 169, 3108),
  OR4     = c("1.34 (0.43 - 4.13)", "0.64 (0.26 - 1.56)", "0.56 (0.05 - 6.09)", "1.25 (0.82 - 1.95)"),
  p4      = c("0.96", "0.58", "0.71", "0.31"),
  n5      = c(487, 1564, 267, 5832),
  OR5     = c("1.48 (0.50 - 4.43)", "1.20 (0.94 - 1.53)", "2.03 (0.87 - 4.76)", "1.18 (1.05 - 1.33)"),
  p5      = c("0.96", "0.42", "0.38", "0.01*")
)

table4_html <- risk_table %>%
  kbl(
    col.names = c("Cohort", "ALS", "Control",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P"),
    align   = c("l", "r", "r", rep(c("r", "l", "c"), 5)),
    caption = "Table 4. Results from evaluating CYP2D6 metaboliser phenotype on ALS risk - Turkey, UK, France and pooled European cohorts"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1, "Samples" = 2,
                     "Any non-NM vs NM" = 3, "PM vs NM" = 3,
                     "IM vs NM" = 3, "UM vs NM" = 3, "PM+IM vs NM" = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(4, bold = TRUE, background = "#f5f5f5") %>%
  kableExtra::footnote(
    general = c(
      "NM - normal metaboliser, IM - intermediate metaboliser, PM - poor metaboliser, UM - ultrarapid metaboliser.",
      "Adj. P - Benjamini-Hochberg FDR adjusted p-value.",
      "Pooled estimates from multivariable logistic regression across European cohorts.",
      "* FDR P < 0.05."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table4_html, "table_risk_Turkey_UK_France_pooled.html")
cat("Saved: table_risk_Turkey_UK_France_pooled.html\n")

# =============================================================================
# TABLE 5: SURVIVAL RESULTS — TURKEY, UK, BELGIUM, FRANCE + POOLED EUROPEAN
# =============================================================================
survival_table <- data.frame(
  Cohort = c("Turkey (all ALS)", "UK", "Belgium", "France",
             "Pooled (multivariable Cox regression)"),
  n1  = c(590, 1035, 480, 194, 4459),
  HR1 = c("1.99 (0.89 - 4.45)", "1.14 (1.00 - 1.31)", "0.87 (0.72 - 1.07)", "0.70 (0.42 - 1.18)", "0.97 (0.91 - 1.04)"),
  p1  = c("0.17", "0.51", "0.51", "0.51", "0.45"),
  n2  = c(564, 600, 264, 117, 2504),
  HR2 = c("1.90 (0.81 - 4.43)", "1.22 (0.92 - 1.61)", "0.77 (0.52 - 1.13)", "0.97 (0.33 - 2.88)", "0.95 (0.83 - 1.09)"),
  p2  = c("0.17", "0.51", "0.51", "0.98", "0.45"),
  n3  = c(545, 952, 424, 178, 4063),
  HR3 = c("2.11 (0.87 - 5.15)", "1.11 (0.96 - 1.28)", "0.86 (0.70 - 1.07)", "0.90 (0.51 - 1.58)", "0.97 (0.90 - 1.03)"),
  p3  = c("0.17", "0.51", "0.51", "0.89", "0.45"),
  n4  = c(379, 545, 234, 113, 2304),
  HR4 = c("1.21 (0.13 - 11.10)", "1.59 (0.90 - 2.83)", "1.68 (0.87 - 3.25)", "0.06 (0.01 - 0.70)", "1.17 (0.93 - 1.47)"),
  p4  = c("0.87", "0.51", "0.51", "0.40", "0.45"),
  n5  = c(386, 1021, 467, 188, 4361),
  HR5 = c("4.44 (0.80 - 24.51)", "1.13 (0.98 - 1.29)", "0.84 (0.69 - 1.03)", "0.84 (0.50 - 1.41)", "0.97 (0.90 - 1.03)"),
  p5  = c("0.17", "0.51", "0.51", "0.78", "0.45")
)

table5_html <- survival_table %>%
  kbl(
    col.names = c("Cohort",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P"),
    align   = c("l", rep(c("r", "l", "c"), 5)),
    caption = "Table 5. CYP2D6 metaboliser phenotype effect on ALS survival - Turkey, UK, Belgium, France and pooled European cohorts"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1,
                     "Any non-NM vs NM" = 3, "PM vs NM" = 3,
                     "IM vs NM" = 3, "UM vs NM" = 3, "PM+IM vs NM" = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  row_spec(1, italic = TRUE) %>%
  row_spec(5, bold = TRUE, background = "#f5f5f5") %>%
  kableExtra::footnote(
    general = c(
      "NM - normal metaboliser, IM - intermediate metaboliser, PM - poor metaboliser, UM - ultrarapid metaboliser.",
      "Adj. P - Benjamini-Hochberg FDR adjusted p-value.",
      "Turkey: covariates age at onset, sex at birth, site of onset, PC1-PC5.",
      "UK, Belgium, France: Cox proportional hazards regression, all ALS subgroup.",
      "Pooled estimates from multivariable Cox regression across European cohorts."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table5_html, "table_survival_all_cohorts_pooled.html")
cat("Saved: table_survival_all_cohorts_pooled.html\n")

# =============================================================================
# TABLE 6: CYP2D6 PHENOTYPE DISTRIBUTION — TURKEY VS EUROPEAN
# =============================================================================
pheno_table <- data.frame(
  Group      = c("ALS cases", "Controls"),
  NM_Turkey  = c("61.2%", "61.8%"),
  NM_Europe  = c("49.4%", "52.5%"),
  IM_Turkey  = c("31.1%", "32.6%"),
  IM_Europe  = c("41.5%", "39.6%"),
  PM_Turkey  = c("3.3%",  "2.8%"),
  PM_Europe  = c("6.9%",  "6.2%"),
  UM_Turkey  = c("4.3%",  "2.8%"),
  UM_Europe  = c("2.2%",  "1.7%"),
  X2         = c("56.11", "7.84"),
  p_value    = c("< 0.001***", "0.049*")
)

table6_html <- pheno_table %>%
  kbl(
    col.names = c("Group",
                  "Turkey", "Europe", "Turkey", "Europe",
                  "Turkey", "Europe", "Turkey", "Europe",
                  "X\u00B2 (df=3)", "p-value"),
    align   = c("l", rep("c", 8), "r", "l"),
    caption = "Table 6. CYP2D6 metaboliser phenotype distribution - Turkey cohort vs published European frequencies"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1,
                     "NM" = 2, "IM" = 2, "PM" = 2, "UM" = 2,
                     "Chi-squared test" = 2)) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(10, bold = TRUE) %>%
  column_spec(11, bold = TRUE) %>%
  kableExtra::footnote(
    general = c(
      "NM - normal metaboliser, IM - intermediate metaboliser, PM - poor metaboliser, UM - ultrarapid metaboliser.",
      "European frequencies sourced from Vallikivi et al. Table 1 (across cohorts).",
      "Turkey ALS cases n=601; Turkey controls n=144.",
      "*** p<0.001, * p<0.05. Chi-squared goodness of fit test."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

save_kable(table6_html, "table_phenotype_Turkey_vs_Europe.html")
cat("Saved: table_phenotype_Turkey_vs_Europe.html\n")

# =============================================================================
# TABLE 7: CYP1A2 GENOTYPE DISTRIBUTION — KUWAIT
# =============================================================================
cyp1a2_table <- data.frame(
  Genotype        = c("*1/*1", "*1/*30", "*30/*30"),
  `Sample Count`  = c(2, 7, 11),
  `Frequency (%)` = c(10, 35, 55),
  check.names = FALSE
)

table7_html <- cyp1a2_table %>%
  kbl(
    col.names = c("Genotype", "Sample Count", "Frequency (%)"),
    align     = c("l", "c", "c"),
    caption   = "Table 7. CYP1A2 genotype distribution in Kuwaiti ALS cohort"
  ) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria") %>%
  column_spec(1, width = "6cm") %>%
  column_spec(2, width = "4cm") %>%
  column_spec(3, width = "4cm") %>%
  row_spec(0, bold = TRUE) %>%
  kableExtra::footnote(
    general = c(
      "Genotyping performed using Aldy v4.8.3.",
      "CYP1A2 is the primary enzyme responsible for riluzole metabolism."
    ),
    general_title     = "Note: ",
    footnote_as_chunk = TRUE,
    escape            = FALSE
  )

writeLines(as.character(table7_html), "table_cyp1a2_Kuwait.html")
cat("Saved: table_cyp1a2_Kuwait.html\n")

# =============================================================================
# FIGURE 1: CYP2D6 STAR ALLELE LOLLIPOP PLOTS — TURKEY AND KUWAIT (PANEL A+B)
# =============================================================================
# --- Turkey ALS cases only ---
df_risk_als  <- df_risk %>% filter(phenotype == "ALS")
turkey_alleles <- c(df_risk_als$Allele1, df_risk_als$Allele2)
turkey_freq <- as.data.frame(table(turkey_alleles)) %>%
  rename(Allele = turkey_alleles, Count = Freq) %>%
  mutate(Frequency = Count / sum(Count)) %>%
  filter(Frequency >= 0.01) %>%
  arrange(desc(Frequency))
turkey_freq$Allele <- as.character(turkey_freq$Allele)

# --- Kuwait ALS cases only ---
kuwait_alleles <- c(kuwait_clean$Allele1, kuwait_clean$Allele2)
kuwait_freq <- as.data.frame(table(kuwait_alleles)) %>%
  rename(Allele = kuwait_alleles, Count = Freq) %>%
  mutate(Frequency = Count / sum(Count)) %>%
  arrange(desc(Frequency))
kuwait_freq$Allele <- as.character(kuwait_freq$Allele)

pA_lollipop <- turkey_freq %>%
  mutate(Allele = factor(Allele, levels = rev(Allele))) %>%
  ggplot(aes(x = Frequency, y = Allele)) +
  geom_segment(aes(x = 0, xend = Frequency, y = Allele, yend = Allele),
               colour = "grey70", linewidth = 0.9) +
  geom_point(size = 6, colour = "#2c3e50") +
  geom_text(aes(label = round(Frequency, 3)),
            hjust = -0.4, size = 5.5, family = "serif") +
  scale_x_continuous(limits = c(0, 0.75),
                     breaks = seq(0, 0.7, 0.1),
                     labels = function(x) paste0(x*100, "%")) +
  labs(
    title    = "*CYP2D6* star allele frequencies",
    subtitle = "Turkey cohort - ALS cases (n=601)",
    x        = "Allele frequency",
    y        = "*CYP2D6* allele"
  ) +
  theme_classic(base_size = 20, base_family = "serif") +
  theme(
    plot.title    = element_markdown(face = "bold", size = 20, family = "serif"),
    plot.subtitle = element_text(size = 17, colour = "grey40", family = "serif"),
    axis.text     = element_text(size = 16, family = "serif"),
    axis.title    = element_text(size = 18, family = "serif"),
    axis.title.y  = element_markdown(size = 18, family = "serif")
  )

pB_lollipop <- kuwait_freq %>%
  mutate(Allele = factor(Allele, levels = rev(Allele))) %>%
  ggplot(aes(x = Frequency, y = Allele)) +
  geom_segment(aes(x = 0, xend = Frequency, y = Allele, yend = Allele),
               colour = "grey70", linewidth = 0.9) +
  geom_point(size = 6, colour = "#2980b9") +
  geom_text(aes(label = round(Frequency, 3)),
            hjust = -0.4, size = 5.5, family = "serif") +
  scale_x_continuous(limits = c(0, 0.75),
                     breaks = seq(0, 0.7, 0.1),
                     labels = function(x) paste0(x*100, "%")) +
  labs(
    title    = "*CYP2D6* star allele frequencies",
    subtitle = "Kuwait cohort - ALS cases (n=18)",
    x        = "Allele frequency",
    y        = "*CYP2D6* allele"
  ) +
  theme_classic(base_size = 20, base_family = "serif") +
  theme(
    plot.title    = element_markdown(face = "bold", size = 20, family = "serif"),
    plot.subtitle = element_text(size = 17, colour = "grey40", family = "serif"),
    axis.text     = element_text(size = 16, family = "serif"),
    axis.title    = element_text(size = 18, family = "serif"),
    axis.title.y  = element_markdown(size = 18, family = "serif")
  )

fig1 <- pA_lollipop + pB_lollipop +
  plot_annotation(
    title      = "*CYP2D6* star allele frequency distribution",
    subtitle   = "Turkey (A) and Kuwait (B) ALS cohorts",
    tag_levels = "A",
    theme = theme(
      plot.title    = element_markdown(face = "bold", size = 24,
                                       family = "serif", hjust = 0.5),
      plot.subtitle = element_text(size = 19, colour = "grey40",
                                   family = "serif", hjust = 0.5),
      plot.tag      = element_text(face = "bold", size = 22, family = "serif")
    )
  )

ggsave("figure1_cyp2d6_allele_freq.png", fig1, width = 20, height = 10, dpi = 300)
cat("Saved: figure1_cyp2d6_allele_freq.png\n")

# =============================================================================
# FIGURE 2: METABOLISER PHENOTYPE BAR CHART — TURKEY
# =============================================================================
pheno_bar <- data.frame(
  Phenotype  = factor(rep(c("NM", "IM", "PM", "UM"), each = 2),
                      levels = c("NM", "IM", "PM", "UM")),
  Group      = factor(rep(c("ALS", "Control"), 4),
                      levels = c("ALS", "Control")),
  Percentage = c(61.2, 61.8, 31.1, 32.6, 3.3, 2.8, 4.3, 2.8)
)

fig2 <- ggplot(pheno_bar, aes(x = Phenotype, y = Percentage, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7),
           width = 0.6, colour = "white") +
  geom_text(aes(label = paste0(Percentage, "%")),
            position = position_dodge(width = 0.7),
            vjust = -0.5, size = 3.5, family = "serif", colour = "grey20") +
  scale_fill_manual(values = c("ALS" = "#2166AC", "Control" = "#B0BEC5")) +
  scale_y_continuous(limits = c(0, 75),
                     breaks = c(0, 25, 50, 75),
                     labels = function(x) paste0(x, "%"),
                     expand = c(0, 0)) +
  labs(
    title    = "CYP2D6 metaboliser phenotype distribution",
    subtitle = "Turkey cohort - ALS cases vs controls",
    x        = "CYP2D6 Metaboliser Phenotype",
    y        = "Percentage (%)",
    fill     = NULL
  ) +
  theme_classic(base_size = 12, base_family = "serif") +
  theme(
    plot.title         = element_text(face = "bold", size = 13),
    plot.subtitle      = element_text(size = 10, colour = "grey40"),
    axis.text          = element_text(size = 11),
    axis.title         = element_text(size = 11),
    legend.position    = "top",
    legend.text        = element_text(size = 11),
    panel.grid.major.y = element_line(colour = "grey92", linewidth = 0.4)
  )

pdf("figure2_phenotype_barchart_Turkey.pdf", width = 8, height = 6)
print(fig2)
dev.off()
cat("Saved: figure2_phenotype_barchart_Turkey.pdf\n")

# =============================================================================
# FIGURE 3: RISK FOREST PLOTS — TURKEY AND FRANCE (PANEL A+B)
# =============================================================================
make_forest_risk <- function(df, title_text, xlim_low, xlim_high,
                             or_label_pos, fdr_label_pos, plot_xlim, xticks) {
  ggplot(df, aes(x = reorder(Comparison, rev(seq_len(nrow(df)))),
                 y = OR, ymin = LCI, ymax = UCI)) +
    geom_hline(yintercept = 1, linetype = "dashed",
               colour = "grey50", linewidth = 0.6) +
    geom_errorbar(aes(ymin = LCI, ymax = UCI),
                  width = 0.2, linewidth = 0.7, colour = "black") +
    geom_point(shape = 18, size = 5, colour = "black") +
    annotate("text", x = 5.7, y = or_label_pos,
             label = "OR (95% CI)", hjust = 0, size = 4,
             family = "serif", fontface = "bold", colour = "grey20") +
    annotate("text", x = 5.7, y = fdr_label_pos,
             label = "FDR p-value", hjust = 0, size = 4,
             family = "serif", fontface = "bold", colour = "grey20") +
    geom_text(aes(y = or_label_pos, label = OR_label),
              hjust = 0, size = 4, family = "serif", colour = "grey20") +
    geom_text(aes(y = fdr_label_pos, label = FDR),
              hjust = 0, size = 4, family = "serif", colour = "grey20") +
    coord_flip(clip = "off") +
    scale_y_log10(limits = c(xlim_low, plot_xlim),
                  breaks = xticks, labels = xticks) +
    labs(title = title_text, x = NULL, y = "Odds Ratio (95% CI)") +
    theme_classic(base_size = 14, base_family = "serif") +
    theme(
      plot.title         = element_markdown(face = "bold", size = 13,
                                            hjust = 0.5, lineheight = 1.3),
      axis.text.y        = element_text(size = 12),
      axis.text.x        = element_text(size = 11),
      axis.title.x       = element_text(size = 12),
      plot.margin        = margin(10, 120, 10, 10),
      panel.grid.major   = element_blank(),
      panel.grid.minor   = element_blank()
    )
}

turkey_risk_df <- data.frame(
  Comparison = factor(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"),
                      levels = rev(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"))),
  OR       = c(1.05, 1.01, 0.98, 1.34, 1.48),
  LCI      = c(0.72, 0.68, 0.66, 0.43, 0.50),
  UCI      = c(1.53, 1.49, 1.47, 4.13, 4.43),
  OR_label = c("1.05 (0.72, 1.53)", "1.01 (0.68, 1.49)",
               "0.98 (0.66, 1.47)", "1.34 (0.43, 4.13)", "1.48 (0.50, 4.43)"),
  FDR      = c("0.96", "0.96", "0.96", "0.96", "0.96")
)

france_risk_df <- data.frame(
  Comparison = factor(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"),
                      levels = rev(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"))),
  OR       = c(1.80, 2.03, 2.20, 1.75, 0.56),
  LCI      = c(0.80, 0.87, 0.86, 0.31, 0.05),
  UCI      = c(4.05, 4.76, 5.58, 9.83, 6.09),
  OR_label = c("1.80 (0.80, 4.05)", "2.03 (0.87, 4.76)",
               "2.20 (0.86, 5.58)", "1.75 (0.31, 9.83)", "0.56 (0.05, 6.09)"),
  FDR      = c("0.42", "0.38", "0.38", "0.64", "0.71")
)

fig3_A <- make_forest_risk(turkey_risk_df,
                           "*CYP2D6* metaboliser phenotype and ALS risk<br>Turkey cohort - multivariable logistic regression",
                           0.25, 6, 9, 55, 130, c(0.25, 0.5, 1, 2, 4, 6))

fig3_B <- make_forest_risk(france_risk_df,
                           "*CYP2D6* metaboliser phenotype and ALS risk<br>France cohort - multivariable logistic regression",
                           0.03, 15, 22, 350, 900, c(0.05, 0.25, 0.5, 1, 2, 4, 8, 15))

fig3 <- fig3_A + fig3_B +
  plot_annotation(tag_levels = "A",
                  theme = theme(plot.tag = element_text(face = "bold", size = 16,
                                                        family = "serif")))

pdf("figure3_risk_forestplot_Turkey_France.pdf", width = 18, height = 7)
print(fig3)
dev.off()
cat("Saved: figure3_risk_forestplot_Turkey_France.pdf\n")

# =============================================================================
# FIGURE 4: SURVIVAL FOREST PLOTS — TURKEY AND UK (PANEL A+B)
# =============================================================================
make_forest_surv <- function(df, title_text, xlim_low, xlim_high,
                             hr_label_pos, fdr_label_pos, plot_xlim, xticks) {
  ggplot(df, aes(x = reorder(Comparison, rev(seq_len(nrow(df)))),
                 y = HR, ymin = LCI, ymax = UCI)) +
    geom_hline(yintercept = 1, linetype = "dashed",
               colour = "grey50", linewidth = 0.6) +
    geom_errorbar(aes(ymin = LCI, ymax = UCI),
                  width = 0.2, linewidth = 0.7, colour = "black") +
    geom_point(shape = 18, size = 5, colour = "black") +
    annotate("text", x = 5.7, y = hr_label_pos,
             label = "HR (95% CI)", hjust = 0, size = 4,
             family = "serif", fontface = "bold", colour = "grey20") +
    annotate("text", x = 5.7, y = fdr_label_pos,
             label = "FDR p-value", hjust = 0, size = 4,
             family = "serif", fontface = "bold", colour = "grey20") +
    geom_text(aes(y = hr_label_pos, label = HR_label),
              hjust = 0, size = 4, family = "serif", colour = "grey20") +
    geom_text(aes(y = fdr_label_pos, label = FDR),
              hjust = 0, size = 4, family = "serif", colour = "grey20") +
    coord_flip(clip = "off") +
    scale_y_log10(limits = c(xlim_low, plot_xlim),
                  breaks = xticks, labels = xticks) +
    labs(title = title_text, x = NULL, y = "Hazard Ratio (95% CI)") +
    theme_classic(base_size = 14, base_family = "serif") +
    theme(
      plot.title         = element_markdown(face = "bold", size = 13,
                                            hjust = 0.5, lineheight = 1.3),
      axis.text.y        = element_text(size = 12),
      axis.text.x        = element_text(size = 11),
      axis.title.x       = element_text(size = 12),
      plot.margin        = margin(10, 120, 10, 10),
      panel.grid.major   = element_blank(),
      panel.grid.minor   = element_blank()
    )
}

turkey_surv_df <- data.frame(
  Comparison = factor(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"),
                      levels = rev(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"))),
  HR       = c(1.99, 1.90, 2.11, 1.21, 4.44),
  LCI      = c(0.89, 0.81, 0.87, 0.13, 0.80),
  UCI      = c(4.45, 4.43, 5.15, 11.10, 24.51),
  HR_label = c("1.99 (0.89, 4.45)", "1.90 (0.81, 4.43)",
               "2.11 (0.87, 5.15)", "1.21 (0.13, 11.10)", "4.44 (0.80, 24.51)"),
  FDR      = c("0.17", "0.17", "0.17", "0.87", "0.17")
)

uk_surv_df <- data.frame(
  Comparison = factor(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"),
                      levels = rev(c("Any non-NM vs NM", "PM + IM vs NM", "IM vs NM", "PM vs NM", "UM vs NM"))),
  HR       = c(1.14, 1.13, 1.11, 1.22, 1.59),
  LCI      = c(1.00, 0.98, 0.96, 0.92, 0.90),
  UCI      = c(1.31, 1.29, 1.28, 1.61, 2.83),
  HR_label = c("1.14 (1.00, 1.31)", "1.13 (0.98, 1.29)",
               "1.11 (0.96, 1.28)", "1.22 (0.92, 1.61)", "1.59 (0.90, 2.83)"),
  FDR      = c("0.51", "0.51", "0.51", "0.51", "0.51")
)

fig4_A <- make_forest_surv(turkey_surv_df,
                           "*CYP2D6* metaboliser phenotype and ALS survival<br>Turkey cohort - multivariable Cox regression",
                           0.10, 30, 50, 500, 1200, c(0.10, 0.25, 0.5, 1, 2, 5, 10, 30))

fig4_B <- make_forest_surv(uk_surv_df,
                           "*CYP2D6* metaboliser phenotype and ALS survival<br>UK cohort - multivariable Cox regression",
                           0.50, 4, 6, 22, 55, c(0.5, 1, 2, 4))

fig4 <- fig4_A + fig4_B +
  plot_annotation(tag_levels = "A",
                  theme = theme(plot.tag = element_text(face = "bold", size = 16,
                                                        family = "serif")))

pdf("figure4_survival_forestplot_Turkey_UK.pdf", width = 18, height = 7)
print(fig4)
dev.off()
cat("Saved: figure4_survival_forestplot_Turkey_UK.pdf\n")

# =============================================================================
# FIGURE 5: KAPLAN-MEIER CURVES — ALL ALS AND RILUZOLE USERS (PANEL A+B)
# =============================================================================
km_fit      <- survfit(Surv(survival_months, event) ~ Cyrius_phenotype,
                       data = df_survival)
km_riluzole <- survfit(Surv(survival_months, event) ~ Cyrius_phenotype,
                       data = df_riluzole)

cols <- c("#0072B2", "#000000", "#D55E00", "#009E73")
ltys <- c(2, 1, 3, 4)

pdf("figure5_km_curves_combined.pdf", width = 16, height = 7)

par(mfrow = c(1, 2), family = "serif", mar = c(5, 5, 4, 2))

# Panel A
plot(km_fit, col = cols, lty = ltys, lwd = 2,
     xlab = "Time (Months)", ylab = "Survival Probability",
     main = "", mark.time = TRUE,
     xlim = c(0, 180), ylim = c(0, 1),
     cex.lab = 1.1, cex.axis = 1.0)
title(main = expression(
  atop(bold(paste(italic("CYP2D6"), " metaboliser phenotype and ALS survival")),
       bold("Turkey cohort - ALS cases"))
), cex.main = 1.1)
legend("bottomleft",
       legend = c("IM - 185", "NM - 360", "PM - 19", "UM - 26"),
       col = cols, lty = ltys, lwd = 2,
       title = "Metaboliser phenotype", bty = "n", cex = 1.0)
mtext("A", side = 3, line = 1, adj = 0, font = 2, cex = 1.4)

# Panel B
plot(km_riluzole, col = cols, lty = ltys, lwd = 2,
     xlab = "Time (Months)", ylab = "Survival Probability",
     main = "", mark.time = TRUE,
     xlim = c(0, 160), ylim = c(0, 1),
     cex.lab = 1.1, cex.axis = 1.0)
title(main = expression(
  atop(bold(paste(italic("CYP2D6"), " metaboliser phenotype and ALS survival")),
       bold("Turkey cohort - confirmed riluzole users"))
), cex.main = 1.1)
legend("bottomleft",
       legend = c("IM - 37", "NM - 75", "PM - 2", "UM - 9"),
       col = cols, lty = ltys, lwd = 2,
       title = "Metaboliser phenotype (n)", bty = "n", cex = 1.0)
mtext("B", side = 3, line = 1, adj = 0, font = 2, cex = 1.4)

dev.off()
cat("Saved: figure5_km_curves_combined.pdf\n")

cat("\n=== ALL TABLES AND FIGURES SAVED ===\n")
cat("Tables (HTML):\n")
cat("  table_baseline_Turkey.html\n")
cat("  table_baseline_Kuwait.html\n")
cat("  table_baseline_UK_France.html\n")
cat("  table_risk_Turkey_UK_France_pooled.html\n")
cat("  table_survival_all_cohorts_pooled.html\n")
cat("  table_phenotype_Turkey_vs_Europe.html\n")
cat("  table_cyp1a2_Kuwait.html\n")
cat("\nFigures (PDF/PNG):\n")
cat("  figure1_cyp2d6_allele_freq.png\n")
cat("  figure2_phenotype_barchart_Turkey.pdf\n")
cat("  figure3_risk_forestplot_Turkey_France.pdf\n")
cat("  figure4_survival_forestplot_Turkey_UK.pdf\n")
cat("  figure5_km_curves_combined.pdf\n")

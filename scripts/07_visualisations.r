install.packages("kableExtra")
library(kableExtra)
library(dplyr)
library(ggplot2)
library(tidyr)
# TABLE 1: RISK ANALYSIS

risk_table <- data.frame(
  Cohort     = "Turkey",
  n1         = 745,  OR1 = "1.05 (0.71–1.55)", p1 = "0.98",
  n2         = 715,  OR2 = "0.99 (0.66–1.49)", p2 = "0.98",
  n3         = 691,  OR3 = "0.96 (0.63–1.47)", p3 = "0.98",
  n4         = 481,  OR4 = "1.20 (0.38–3.81)", p4 = "0.98",
  n5         = 487,  OR5 = "1.51 (0.49–4.64)", p5 = "0.98"
)

risk_html <- risk_table %>%
  kbl(
    col.names = c("Cohort",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P"),
    align = c("l", rep(c("r", "l", "c"), 5)),
    caption = "Table 1. Results from evaluating CYP2D6 metaboliser phenotype on ALS risk — Turkey cohort"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1,
                     "Any non-NM vs NM" = 3,
                     "PM + IM vs NM"    = 3,
                     "IM vs NM"         = 3,
                     "PM vs NM"         = 3,
                     "UM vs NM"         = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  footnote(general = c(
    "NM – normal metaboliser, IM – intermediate metaboliser, PM – poor metaboliser, UM – ultrarapid metaboliser.",
    "Adj. P – Benjamini-Hochberg FDR adjusted p-value.",
    "Covariates: age at onset, sex at birth, PC1–PC20.",
    "Omitted covariates (unavailable): family history, sequencing technology, C9orf72 status."
  ))

# TABLE 2: SURVIVAL ANALYSIS
# =============================================================

survival_table <- data.frame(
  Cohort     = "Turkey (all ALS)",
  n1         = 590,  HR1 = "2.17 (0.92–5.13)",   p1 = "0.19",
  n2         = 564,  HR2 = "1.95 (0.77–4.93)",   p2 = "0.20",
  n3         = 545,  HR3 = "2.21 (0.80–6.11)",   p3 = "0.20",
  n4         = 379,  HR4 = "0.80 (0.03–18.85)",  p4 = "0.89",
  n5         = 386,  HR5 = "7.02 (0.88–56.35)",  p5 = "0.19"
)

survival_html <- survival_table %>%
  kbl(
    col.names = c("Cohort",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P"),
    align = c("l", rep(c("r", "l", "c"), 5)),
    caption = "Table 2. Results from evaluating CYP2D6 metaboliser phenotype on ALS survival — Turkey cohort"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1,
                     "Any non-NM vs NM" = 3,
                     "PM + IM vs NM"    = 3,
                     "IM vs NM"         = 3,
                     "PM vs NM"         = 3,
                     "UM vs NM"         = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  footnote(general = c(
    "NM – normal metaboliser, IM – intermediate metaboliser, PM – poor metaboliser, UM – ultrarapid metaboliser.",
    "Adj. P – Benjamini-Hochberg FDR adjusted p-value.",
    "Covariates: age at onset, sex at birth, site of onset, PC1–PC20.",
    "Omitted covariates (unavailable): C9orf72 status, family history.",
    "Riluzole subgroup analysis not performed — insufficient events (n=5).",
    "26 deaths out of 590 ALS cases."
  ))

# =============================================================
# SAVE AS HTML FILES
# =============================================================

save_kable(risk_html,     "table_risk_results.html")
save_kable(survival_html, "table_survival_results.html")

cat("Saved:\n")
cat("  table_risk_results.html\n")
cat("  table_survival_results.html\n")


# =============================================================
# TABLE 1: BASELINE CHARACTERISTICS
# =============================================================
baseline_table <- data.frame(
  Characteristic = c(
    "n",
    "Age, mean (SD)",
    "Male sex, % (n)",
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
    "0.141",
    "3.3%",
    "31.1%",
    "61.2%",
    "4.3%"
  ),
  Control = c(
    "144",
    "53.2 (17.1)",
    "45.8% (66)",
    "0.188",
    "2.8%",
    "32.6%",
    "61.8%",
    "2.8%"
  )
)

baseline_html <- baseline_table %>%
  kbl(
    col.names = c("Characteristic", "ALS (n = 601)", "Control (n = 144)"),
    align     = c("l", "c", "c"),
    caption   = "Table 1. Baseline characteristics of ALS cases and controls"
  ) %>%
  kable_classic(full_width = FALSE, html_font = "Cambria") %>%
  column_spec(1, width = "12cm") %>%   # Characteristic column
  column_spec(2, width = "4cm") %>%    # ALS column
  column_spec(3, width = "4cm") %>%    # Control column
  row_spec(0, bold = TRUE) %>%
  row_spec(1, bold = TRUE, background = "#f5f5f5") %>%
  pack_rows("Demographics", 2, 3) %>%
  pack_rows("CYP2D6 Genotype", 4, 4) %>%
  pack_rows("CYP2D6 Metaboliser Phenotype", 5, 8) %>%
  footnote(general = c(
    "SD – standard deviation.",
    "CYP2D6 *4 allele frequency estimated from genotype data.",
    "PM – poor metaboliser, IM – intermediate metaboliser, NM – normal metaboliser, UM – ultrarapid metaboliser."
  ))
# =============================================================
# SAVE AS HTML
# =============================================================
save_kable(baseline_html, "table_baseline_characteristics.html")
cat("Saved: table_baseline_characteristics.html\n")

packages <- c("kableExtra", "dplyr", "tableone", "flextable", "officer", "BSDA")

pkg_info <- lapply(packages, function(pkg) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    data.frame(
      Package = pkg,
      Version = as.character(packageVersion(pkg)),
      stringsAsFactors = FALSE
    )
  } else {
    data.frame(Package = pkg, Version = "NOT INSTALLED", stringsAsFactors = FALSE)
  }
})

do.call(rbind, pkg_info)

# =============================================================
# DATA: UK & FRANCE COHORTS
# =============================================================
data <- data.frame(
  Cohort      = c("UK", "France"),
  ALS         = c(1211, 239),
  Control     = c(380, 38),
  
  # Any non-NM vs NM
  n1          = c(1591, 277),
  OR1         = c(1.17, 1.80),
  LCI1        = c(0.92, 0.80),
  UCI1        = c(1.49, 4.05),
  p1          = c("0.42", "0.42"),
  
  # PM vs NM
  n2          = c(924, 174),
  OR2         = c(1.30, 1.75),
  LCI2        = c(0.79, 0.31),
  UCI2        = c(2.13, 9.83),
  p2          = c("0.55", "0.64"),
  
  # IM vs NM
  n3          = c(1453, 252),
  OR3         = c(1.19, 2.20),
  LCI3        = c(0.92, 0.86),
  UCI3        = c(1.54, 5.58),
  p3          = c("0.42", "0.38"),
  
  # UM vs NM
  n4          = c(840, 169),
  OR4         = c(0.64, 0.56),
  LCI4        = c(0.26, 0.05),
  UCI4        = c(1.56, 6.09),
  p4          = c("0.58", "0.71"),
  
  # PM+IM vs NM
  n5          = c(1564, 267),
  OR5         = c(1.20, 2.03),
  LCI5        = c(0.94, 0.87),
  UCI5        = c(1.53, 4.76),
  p5          = c("0.42", "0.38")
)

# TABLE

table_df <- data.frame(
  Cohort  = data$Cohort,
  ALS     = data$ALS,
  Control = data$Control,
  
  n1 = data$n1,
  OR1 = sprintf("%.2f (%.2f – %.2f)", data$OR1, data$LCI1, data$UCI1),
  p1 = data$p1,
  
  n2 = data$n2,
  OR2 = sprintf("%.2f (%.2f – %.2f)", data$OR2, data$LCI2, data$UCI2),
  p2 = data$p2,
  
  n3 = data$n3,
  OR3 = sprintf("%.2f (%.2f – %.2f)", data$OR3, data$LCI3, data$UCI3),
  p3 = data$p3,
  
  n4 = data$n4,
  OR4 = sprintf("%.2f (%.2f – %.2f)", data$OR4, data$LCI4, data$UCI4),
  p4 = data$p4,
  
  n5 = data$n5,
  OR5 = sprintf("%.2f (%.2f – %.2f)", data$OR5, data$LCI5, data$UCI5),
  p5 = data$p5
)

risk_html <- table_df %>%
  kbl(
    col.names = c("Cohort", "ALS", "Control",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P"),
    align = c("l", "r", "r", rep(c("r","l","c"), 5)),
    caption = "Table. Results from evaluating CYP2D6 metaboliser phenotype on ALS risk — UK and France cohorts"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" " = 1,
                     "Samples" = 2,
                     "Any non-NM vs NM" = 3,
                     "PM vs NM"         = 3,
                     "IM vs NM"         = 3,
                     "UM vs NM"         = 3,
                     "PM+IM vs NM"      = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  footnote(general = c(
    "IM – intermediate metaboliser, NM – normal metaboliser, PM – poor metaboliser, UM – ultrarapid metaboliser.",
    "Adj. P – Benjamini-Hochberg FDR adjusted p-value."
  ))

save_kable(risk_html, "table_UK_France_risk.html")

library(forestplot)
library(grid)

# =============================================================
# UK COHORT
# =============================================================
tabletext_uk <- cbind(
  c("Comparison",
    "Any non-NM vs NM",
    "PM + IM vs NM",
    "IM vs NM",
    "PM vs NM",
    "UM vs NM"),
  c("OR (95% CI)",
    "1.17 (0.92, 1.49)",
    "1.20 (0.94, 1.53)",
    "1.19 (0.92, 1.54)",
    "1.30 (0.79, 2.13)",
    "0.64 (0.26, 1.56)"),
  c("FDR q-value",
    "0.42",
    "0.42",
    "0.42",
    "0.55",
    "0.58")
)

mean_uk  <- c(NA, 1.17, 1.20, 1.19, 1.30, 0.64)
low_uk   <- c(NA, 0.92, 0.94, 0.92, 0.79, 0.26)
high_uk  <- c(NA, 1.49, 1.53, 1.54, 2.13, 1.56)

png("forest_plot_UK.png", width = 2800, height = 1600, res = 300)
forestplot(
  labeltext   = tabletext_uk,
  mean        = mean_uk,
  lower       = low_uk,
  upper       = high_uk,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Odds Ratio (95% CI)",
  title     = "CYP2D6 metaboliser phenotype and ALS risk\nUK cohort — multivariable logistic regression",
  graph.pos = 2
)
dev.off()
cat("Saved: forest_plot_UK.png\n")

# =============================================================
# FRANCE COHORT
# =============================================================
tabletext_fr <- cbind(
  c("Comparison",
    "Any non-NM vs NM",
    "PM + IM vs NM",
    "IM vs NM",
    "PM vs NM",
    "UM vs NM"),
  c("OR (95% CI)",
    "1.80 (0.80, 4.05)",
    "2.03 (0.87, 4.76)",
    "2.20 (0.86, 5.58)",
    "1.75 (0.31, 9.83)",
    "0.56 (0.05, 6.09)"),
  c("FDR q-value",
    "0.42",
    "0.38",
    "0.38",
    "0.64",
    "0.71")
)

mean_fr  <- c(NA, 1.80, 2.03, 2.20, 1.75, 0.56)
low_fr   <- c(NA, 0.80, 0.87, 0.86, 0.31, 0.05)
high_fr  <- c(NA, 4.05, 4.76, 5.58, 9.83, 6.09)

png("forest_plot_France.png", width = 2800, height = 1600, res = 300)
forestplot(
  labeltext   = tabletext_fr,
  mean        = mean_fr,
  lower       = low_fr,
  upper       = high_fr,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Odds Ratio (95% CI)",
  title     = "CYP2D6 metaboliser phenotype and ALS risk\nFrance cohort — multivariable logistic regression",
  graph.pos = 2
)
dev.off()
cat("Saved: forest_plot_France.png\n")

# DATA
# =============================================================

survival_data <- data.frame(
  Cohort  = c("UK", "France", "Belgium"),
  ALS_n   = c("1035", "194", "480"),
  
  # Any non-NM vs NM
  n1      = c(1035, 194, 480),
  HR1     = c(1.14, 0.70, 0.87),
  LCI1    = c(1.00, 0.42, 0.72),
  UCI1    = c(1.31, 1.18, 1.07),
  p1      = c("0.51", "0.51", "0.51"),
  
  # PM vs NM
  n2      = c(600, 117, 264),
  HR2     = c(1.22, 0.97, 0.77),
  LCI2    = c(0.92, 0.33, 0.52),
  UCI2    = c(1.61, 2.88, 1.13),
  p2      = c("0.51", "0.98", "0.51"),
  
  # IM vs NM
  n3      = c(952, 178, 424),
  HR3     = c(1.11, 0.90, 0.86),
  LCI3    = c(0.96, 0.51, 0.70),
  UCI3    = c(1.28, 1.58, 1.07),
  p3      = c("0.51", "0.89", "0.51"),
  
  # UM vs NM
  n4      = c(545, 113, 234),
  HR4     = c(1.59, 0.06, 1.68),
  LCI4    = c(0.90, 0.01, 0.87),
  UCI4    = c(2.83, 0.70, 3.25),
  p4      = c("0.51", "0.40", "0.51"),
  
  # PM+IM vs NM
  n5      = c(1021, 188, 467),
  HR5     = c(1.13, 0.84, 0.84),
  LCI5    = c(0.98, 0.50, 0.69),
  UCI5    = c(1.29, 1.41, 1.03),
  p5      = c("0.51", "0.78", "0.51")
)

# =============================================================
# PUBLICATION TABLE — ALL ALS
# =============================================================
table_df <- data.frame(
  Cohort = survival_data$Cohort,
  
  n1 = survival_data$n1,
  HR1 = sprintf("%.2f (%.2f – %.2f)", survival_data$HR1, survival_data$LCI1, survival_data$UCI1),
  p1  = survival_data$p1,
  
  n2 = survival_data$n2,
  HR2 = sprintf("%.2f (%.2f – %.2f)", survival_data$HR2, survival_data$LCI2, survival_data$UCI2),
  p2  = survival_data$p2,
  
  n3 = survival_data$n3,
  HR3 = sprintf("%.2f (%.2f – %.2f)", survival_data$HR3, survival_data$LCI3, survival_data$UCI3),
  p3  = survival_data$p3,
  
  n4 = survival_data$n4,
  HR4 = sprintf("%.2f (%.2f – %.2f)", survival_data$HR4, survival_data$LCI4, survival_data$UCI4),
  p4  = survival_data$p4,
  
  n5 = survival_data$n5,
  HR5 = sprintf("%.2f (%.2f – %.2f)", survival_data$HR5, survival_data$LCI5, survival_data$UCI5),
  p5  = survival_data$p5
)

survival_html <- table_df %>%
  kbl(
    col.names = c("Cohort",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P",
                  "n", "HR (95% CI)", "Adj. P"),
    align = c("l", rep(c("r", "l", "c"), 5)),
    caption = "Table. CYP2D6 metaboliser phenotype effect on ALS survival — UK, France and Belgium cohorts (All ALS)"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" "          = 1,
                     "Any non-NM vs NM" = 3,
                     "PM vs NM"         = 3,
                     "IM vs NM"         = 3,
                     "UM vs NM"         = 3,
                     "PM+IM vs NM"      = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  footnote(general = c(
    "IM – intermediate metaboliser, NM – normal metaboliser, PM – poor metaboliser, UM – ultrarapid metaboliser.",
    "Adj. P – Benjamini-Hochberg FDR adjusted p-value.",
    "All ALS subgroup. Cox proportional hazards regression."
  ))


cat("Saved: table_survival_UK_France_Belgium.html\n")



# =============================================================
# FOREST PLOT FUNCTION
# =============================================================
# Test forestplot works at all
tabletext <- cbind(
  c("Comparison",       "Any non-NM vs NM", "PM + IM vs NM",
    "IM vs NM",         "PM vs NM",         "UM vs NM"),
  c("HR (95% CI)",      "1.14 (1.00, 1.31)", "1.13 (0.98, 1.29)",
    "1.11 (0.96, 1.28)","1.22 (0.92, 1.61)", "1.59 (0.90, 2.83)"),
  c("FDR q-value",      "0.51", "0.51", "0.51", "0.51", "0.51")
)

mean_vals <- c(NA,  1.14, 1.13, 1.11, 1.22, 1.59)
low_vals  <- c(NA,  1.00, 0.98, 0.96, 0.92, 0.90)
high_vals <- c(NA,  1.31, 1.29, 1.28, 1.61, 2.83)

# --- Step 1: test on screen first (no PNG) ---
forestplot(
  labeltext   = tabletext,
  mean        = mean_vals,
  lower       = low_vals,
  upper       = high_vals,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Hazard Ratio (95% CI)",
  title     = "CYP2D6 Metaboliser phenotype and ALS survival 
  UK cohort — multivarible Cox regression",
  graph.pos = 2
)

# Test forestplot works at all
tabletext <- cbind(
  c("Comparison",       "Any non-NM vs NM", "PM + IM vs NM",
    "IM vs NM",         "PM vs NM",         "UM vs NM"),
  c("HR (95% CI)",      "1.14 (1.00, 1.31)", "1.13 (0.98, 1.29)",
    "1.11 (0.96, 1.28)","1.22 (0.92, 1.61)", "1.59 (0.90, 2.83)"),
  c("FDR q-value",      "0.51", "0.51", "0.51", "0.51", "0.51")
)

mean_vals <- c(NA,  1.14, 1.13, 1.11, 1.22, 1.59)
low_vals  <- c(NA,  1.00, 0.98, 0.96, 0.92, 0.90)
high_vals <- c(NA,  1.31, 1.29, 1.28, 1.61, 2.83)

# --- Step 1: test on screen first (no PNG) ---
forestplot(
  labeltext   = tabletext,
  mean        = mean_vals,
  lower       = low_vals,
  upper       = high_vals,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Hazard Ratio (95% CI)",
  title     = "UK cohort — Cox regression",
  graph.pos = 2
)


# FRANCE

tabletext_fr <- cbind(
  c("Comparison",        "Any non-NM vs NM",  "PM + IM vs NM",
    "IM vs NM",          "PM vs NM",           "UM vs NM"),
  c("HR (95% CI)",       "0.70 (0.42, 1.18)", "0.84 (0.50, 1.41)",
    "0.90 (0.51, 1.58)", "0.97 (0.33, 2.88)", "0.06 (0.01, 0.70)"),
  c("FDR q-value",       "0.51", "0.78", "0.89", "0.98", "0.40")
)

mean_fr  <- c(NA,  0.70, 0.84, 0.90, 0.97, 0.06)
low_fr   <- c(NA,  0.42, 0.50, 0.51, 0.33, 0.01)
high_fr  <- c(NA,  1.18, 1.41, 1.58, 2.88, 0.70)

forestplot(
  labeltext   = tabletext_fr,
  mean        = mean_fr,
  lower       = low_fr,
  upper       = high_fr,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Hazard Ratio (95% CI)",
  title     = "CYP2D6 metaboliser phenotype and ALS survival\nFrance cohort — multivariable Cox regression (All ALS)",
  graph.pos = 2
)


png("forest_survival_France.png", width = 2800, height = 1600, res = 300)
dev.off()


# =============================================================
# BELGIUM
# =============================================================
tabletext_be <- cbind(
  c("Comparison",        "Any non-NM vs NM",  "PM + IM vs NM",
    "IM vs NM",          "PM vs NM",           "UM vs NM"),
  c("HR (95% CI)",       "0.87 (0.72, 1.07)", "0.84 (0.69, 1.03)",
    "0.86 (0.70, 1.07)", "0.77 (0.52, 1.13)", "1.68 (0.87, 3.25)"),
  c("FDR q-value",       "0.51", "0.51", "0.51", "0.51", "0.51")
)

mean_be  <- c(NA,  0.87, 0.84, 0.86, 0.77, 1.68)
low_be   <- c(NA,  0.72, 0.69, 0.70, 0.52, 0.87)
high_be  <- c(NA,  1.07, 1.03, 1.07, 1.13, 3.25)

forestplot(
  labeltext   = tabletext_be,
  mean        = mean_be,
  lower       = low_be,
  upper       = high_be,
  zero        = 1,
  xlog        = TRUE,
  col         = fpColors(box = "black", line = "black", zero = "grey50"),
  fn.ci_norm  = fpDrawDiamondCI,
  boxsize     = 0.25,
  lwd.zero    = 1.5,
  lwd.ci      = 1.5,
  ci.vertices = TRUE,
  txt_gp      = fpTxtGp(
    label = gpar(cex = 0.9),
    ticks = gpar(cex = 0.85),
    xlab  = gpar(cex = 0.9),
    title = gpar(cex = 1.1, fontface = "bold")
  ),
  xlab      = "Hazard Ratio (95% CI)",
  title     = "CYP2D6 metaboliser phenotype and ALS survival\nBelgium cohort — multivariable Cox regression (All ALS)",
  graph.pos = 2
)

png("forest_survival_Belgium.png", width = 2800, height = 1600, res = 300)
dev.off()

# TABLE: TURKEY COHORT — RISK
# =============================================================
risk_table <- data.frame(
  Cohort      = "Turkey",
  ALS         = 601,
  Control     = 144,
  
  n1          = 745,
  OR1         = "1.05 (0.72 – 1.53)",
  p1          = "0.96",
  
  n2          = 715,
  OR2         = "1.01 (0.68 – 1.49)",
  p2          = "0.96",
  
  n3          = 691,
  OR3         = "0.98 (0.66 – 1.47)",
  p3          = "0.96",
  
  n4          = 481,
  OR4         = "1.34 (0.43 – 4.13)",
  p4          = "0.96",
  
  n5          = 487,
  OR5         = "1.48 (0.50 – 4.43)",
  p5          = "0.96"
)

risk_html <- risk_table %>%
  kbl(
    col.names = c("Cohort", "ALS", "Control",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P",
                  "n", "OR (95% CI)", "Adj. P"),
    align = c("l", "r", "r", rep(c("r", "l", "c"), 5)),
    caption = "Table 2. Results from evaluating CYP2D6 metaboliser phenotype on ALS risk — Turkey cohort"
  ) %>%
  kable_classic(full_width = TRUE, html_font = "Cambria") %>%
  add_header_above(c(" "                  = 1,
                     "Samples"            = 2,
                     "Any non-NM vs NM"   = 3,
                     "PM + IM vs NM"      = 3,
                     "IM vs NM"           = 3,
                     "PM vs NM"           = 3,
                     "UM vs NM"           = 3)) %>%
  row_spec(0, bold = TRUE) %>%
  footnote(general = c(
    "NM – normal metaboliser, IM – intermediate metaboliser, PM – poor metaboliser, UM – ultrarapid metaboliser.",
    "Adj. P – Benjamini-Hochberg FDR adjusted p-value.",
    "Covariates: age at onset, sex at birth, PC1–PC5.",
    "ALS and Control columns reflect the total samples; n per comparison varies due to missing genotype data."
  ))

save_kable(risk_html, "table_turkey_risk.html")
cat("Saved: table_turkey_risk.html\n")

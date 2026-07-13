
table(df_risk$site_of_onset, df_risk$phenotype)


library(kableExtra)
library(dplyr)

# =============================================================
# TABLE: TURKEY COHORT BASELINE CHARACTERISTICS
# =============================================================
baseline_table <- data.frame(
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
    "3.3%",
    "31.1%",
    "61.2%",
    "4.3%"
  ),
  Control = c(
    "144",
    "53.2 (17.1)",
    "45.8% (66)",
    "",
    "NA",
    "NA",
    "NA",
    "NA",
    "NA",
    "0.19",
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

save_kable(baseline_html, "table_baseline_Turkey.html")
cat("Saved: table_baseline_Turkey.html\n")

# Turkey
table(df_risk$Allele1)
table(df_risk$Allele2)

# Kuwait - excluding unresolved phenotype
kuwait_clean <- kuwait[kuwait$Cyrius_phenotype != "unknown", ]
table(kuwait_clean$Allele1)
table(kuwait_clean$Allele2)

library(ggplot2)
library(dplyr)
library(scales)
library(patchwork)

setwd("/Users/youssrasemlali/Desktop/RESEARCH PROJECT/scripts")

# =============================================================
# TURKEY
# =============================================================
turkey_alleles <- c(df_risk$Allele1, df_risk$Allele2)
turkey_freq <- as.data.frame(table(turkey_alleles)) %>%
  rename(Allele = turkey_alleles, Count = Freq) %>%
  mutate(Frequency = Count / sum(Count)) %>%
  filter(Frequency >= 0.01) %>%
  arrange(desc(Frequency))

turkey_freq$Allele <- as.character(turkey_freq$Allele)

p_turkey <- ggplot(turkey_freq, aes(x = reorder(Allele, Frequency), y = Frequency)) +
  geom_segment(aes(xend = reorder(Allele, Frequency), y = 0, yend = Frequency),
               colour = "grey60", linewidth = 0.7) +
  geom_point(size = 4, colour = "#2166AC") +
  geom_text(aes(label = sprintf("%.3f", Frequency)),
            hjust = -0.3, size = 3.2, family = "serif", colour = "grey20") +
  coord_flip() +
  scale_y_continuous(
    limits = c(0, 0.50),
    labels = percent_format(accuracy = 1)
  ) +
  labs(
    title    = "Turkey cohort",
    x        = "CYP2D6 Star Allele",
    y        = "Allele Frequency",
    caption  = "Alleles with frequency < 1% not shown."
  ) +
  theme_classic(base_size = 12, base_family = "serif") +
  theme(
    plot.title         = element_text(face = "bold", size = 12),
    plot.caption       = element_text(size = 9, colour = "grey40",
                                      face = "italic", hjust = 0),
    axis.text.y        = element_text(size = 11),
    axis.text.x        = element_text(size = 10),
    panel.grid.major.x = element_line(colour = "grey92", linewidth = 0.4),
    axis.ticks.y       = element_blank()
  )

# =============================================================
# KUWAIT
# =============================================================
kuwait_alleles <- c(kuwait_clean$Allele1, kuwait_clean$Allele2)
kuwait_freq <- as.data.frame(table(kuwait_alleles)) %>%
  rename(Allele = kuwait_alleles, Count = Freq) %>%
  mutate(Frequency = Count / sum(Count)) %>%
  arrange(desc(Frequency))

kuwait_freq$Allele <- as.character(kuwait_freq$Allele)

p_kuwait <- ggplot(kuwait_freq, aes(x = reorder(Allele, Frequency), y = Frequency)) +
  geom_segment(aes(xend = reorder(Allele, Frequency), y = 0, yend = Frequency),
               colour = "grey60", linewidth = 0.7) +
  geom_point(size = 4, colour = "#D6604D") +
  geom_text(aes(label = sprintf("%.3f", Frequency)),
            hjust = -0.3, size = 3.2, family = "serif", colour = "grey20") +
  coord_flip() +
  scale_y_continuous(
    limits = c(0, 0.50),
    labels = percent_format(accuracy = 1)
  ) +
  labs(
    title = "Kuwait cohort",
    x     = "CYP2D6 Star Allele",
    y     = "Allele Frequency"
  ) +
  theme_classic(base_size = 12, base_family = "serif") +
  theme(
    plot.title         = element_text(face = "bold", size = 12),
    axis.text.y        = element_text(size = 11),
    axis.text.x        = element_text(size = 10),
    panel.grid.major.x = element_line(colour = "grey92", linewidth = 0.4),
    axis.ticks.y       = element_blank()
  )

# =============================================================
# COMBINE WITH PATCHWORK
# =============================================================
combined <- p_turkey + p_kuwait +
  plot_annotation(
    title   = "CYP2D6 star allele frequencies",
    theme   = theme(
      plot.title = element_text(face = "bold", size = 14,
                                family = "serif", hjust = 0.5)
    )
  )

pdf("lollipop_alleles_combined.pdf", width = 16, height = 7)
print(combined)
dev.off()
system("open lollipop_alleles_combined.pdf")

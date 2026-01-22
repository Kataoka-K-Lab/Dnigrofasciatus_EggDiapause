# Load necessary libraries
library(ggplot2)
library(dplyr)

# Extract rows where the source column is "KEGG"
kegg_data <- combined_data %>% filter(source == "KEGG")

term_order <- c(
                "beta-Alanine metabolism",
                "Lysine degradation",
                "Tryptophan metabolism",
                "Valine, leucine and isoleucine degradation",
                "Nucleocytoplasmic transport",
                "Proteasome",
                "Protein processing in endoplasmic reticulum",
                "Ribosome",
                "Ubiquitin mediated proteolysis",
                "Spliceosome",
                "Various types of N-glycan biosynthesis",
                "Endocytosis",
                "SNARE interactions in vesicular transport",
                "ATP-dependent chromatin remodeling",
                "Glycolysis / Gluconeogenesis",
                "TGF-beta signaling pathway"
                )
                
kegg_data$term_name <- factor(kegg_data$term_name, levels = rev(term_order))

kegg_data$Change <- factor(kegg_data$Change, levels = c("up", "down"))

p <- ggplot(kegg_data, aes(x = Time, y = term_name, size = gene_ratio, color = adjusted_p_value)) +
    geom_point(alpha = 0.6) +
    scale_color_gradient(low = "blue", high = "red") +
    theme_minimal() +
    labs(title = "GO Enrichment Analysis Results",
         x = "Time", y = "Term Name",
         color = "Adjusted P-value",
         size = "Gene ratio(%)") +
    facet_grid(~ Change) +
    theme(axis.text.y = element_text(hjust = 1))

print(p)

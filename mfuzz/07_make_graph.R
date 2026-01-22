library(ggplot2)
library(dplyr)
library(readr)

file_path <- "/Users/kosukekataoka/Downloads/gprofiler_results"
files <- list.files(file_path, pattern = "*.csv", full.names = TRUE)

source_colors <- c("GO:MF" = "#1f77b4", "GO:BP" = "#ff7f0e", "GO:CC" = "#2ca02c", "KEGG" = "#d62728")

for (file in files) {
  data <- read_csv(file)
  
  filtered_data <- data %>% filter(source %in% c("GO:MF", "GO:BP", "GO:CC", "KEGG"))
  
  filtered_data <- filtered_data %>%
    mutate(log10_adjusted_p_value = -log10(adjusted_p_value))
  
  top_terms <- filtered_data %>%
    group_by(source) %>%
    slice_max(order_by = log10_adjusted_p_value, n = 5, with_ties = FALSE) %>%
    ungroup()
  
  top_terms <- top_terms %>%
    group_by(source) %>%
    do({
      if (nrow(.) < 5) {
        missing_count <- 5 - nrow(.)
        dummy_data <- data.frame(
          source = unique(.$source),
          term_name = paste0("Dummy ", seq_len(missing_count)),
          log10_adjusted_p_value = 0
        )
        bind_rows(., dummy_data)
      } else {
        .
      }
    }) %>%
    ungroup()
  
  for (src in c("GO:MF", "GO:BP", "GO:CC", "KEGG")) {
    if (!(src %in% top_terms$source)) {
      dummy_data <- data.frame(
        source = src,
        term_name = paste0("Dummy ", 1:5),
        log10_adjusted_p_value = 0
      )
      top_terms <- bind_rows(top_terms, dummy_data)
    }
  }
  
  classification <- ifelse(grepl("Homochronic", basename(file)), "Homochronic", "Heterochronic")
  top_terms <- top_terms %>%
    mutate(file = basename(file), Classification = classification)
  
  max_log10_adjusted_p_value <- max(top_terms$log10_adjusted_p_value, na.rm = TRUE)
  y_limit <- max_log10_adjusted_p_value * 1.2
  
  p <- ggplot(top_terms, aes(x = reorder(term_name, log10_adjusted_p_value), y = log10_adjusted_p_value, fill = source)) +
    geom_bar(stat = "identity", width = 0.6) +
    facet_wrap(~ source, scales = "free", ncol = 4) +
    scale_fill_manual(values = source_colors) +
    coord_flip() +
    scale_y_continuous(limits = c(0, y_limit)) +
    labs(x = "Term Name", y = "-log10 Adjusted p-value", title = paste("Top Enriched Terms in", classification, "-", basename(file))) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      strip.text = element_text(size = 12, face = "bold")
    )
  
  output_path <- paste0(file_path, "/", tools::file_path_sans_ext(basename(file)), "_enriched_terms.pdf")
  ggsave(filename = output_path, plot = p, device = "pdf", width = 20, height = 3)
}

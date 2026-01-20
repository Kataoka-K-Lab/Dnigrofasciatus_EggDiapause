library(dplyr)

file_paths <- list(
  "Egg_12h" = "/Users/kataokak/Downloads/egg_filter2/Egg_12h/deseq_normalized_counts.csv",
  "Egg_24h" = "/Users/kataokak/Downloads/egg_filter2/Egg_24h/deseq_normalized_counts.csv",
  "Egg_40h" = "/Users/kataokak/Downloads/egg_filter2/Egg_40h/deseq_normalized_counts.csv",
  "Egg_56h" = "/Users/kataokak/Downloads/egg_filter2/Egg_56h/deseq_normalized_counts.csv",
  "Egg_72h" = "/Users/kataokak/Downloads/egg_filter2/Egg_72h/deseq_normalized_counts.csv"
)

results <- list()

process_file <- function(file_path, time_label) {
  data <- read.csv(file_path, row.names = 1)
  
  long_columns <- grep("Long", colnames(data), value = TRUE)
  short_columns <- grep("Short", colnames(data), value = TRUE)
  
  data <- data %>%
    mutate(!!paste0(time_label, "_Long_avg") := rowMeans(select(., all_of(long_columns))),
           !!paste0(time_label, "_Long_stdev") := apply(select(., all_of(long_columns)), 1, sd),
           !!paste0(time_label, "_Short_avg") := rowMeans(select(., all_of(short_columns))),
           !!paste0(time_label, "_Short_stdev") := apply(select(., all_of(short_columns)), 1, sd))
  
  data <- data %>%
    filter(!!sym(paste0(time_label, "_Long_stdev")) != 0 & !!sym(paste0(time_label, "_Short_stdev")) != 0)
  
  output_path <- paste0("/Users/kataokak/Downloads/egg_filter2/", time_label, "_deseq_normalized_counts_processed.csv")
  write.csv(data, output_path, row.names = TRUE)
  
  return(data)
}

for (time_label in names(file_paths)) {
  results[[time_label]] <- process_file(file_paths[[time_label]], time_label)
}

Egg_12h_processed <- results[["Egg_12h"]]
Egg_24h_processed <- results[["Egg_24h"]]
Egg_40h_processed <- results[["Egg_40h"]]
Egg_56h_processed <- results[["Egg_56h"]]
Egg_72h_processed <- results[["Egg_72h"]]

# lapply(names(results), function(x) head(results[[x]]))

add_log2_ratio <- function(df, time_label) {
  df[[paste0(time_label, "_Log2_Ratio")]] <- log2(df[[paste0(time_label, "_Long_avg")]] / df[[paste0(time_label, "_Short_avg")]])
  return(df)
}

Egg_12h_processed <- add_log2_ratio(Egg_12h_processed, "Egg_12h")
Egg_24h_processed <- add_log2_ratio(Egg_24h_processed, "Egg_24h")
Egg_40h_processed <- add_log2_ratio(Egg_40h_processed, "Egg_40h")
Egg_56h_processed <- add_log2_ratio(Egg_56h_processed, "Egg_56h")
Egg_72h_processed <- add_log2_ratio(Egg_72h_processed, "Egg_72h")

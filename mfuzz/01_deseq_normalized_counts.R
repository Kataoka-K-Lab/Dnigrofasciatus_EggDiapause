library(Mfuzz)
library(Biobase)

extract_avg_columns <- function(df, time_label) {
  long_avg_col <- df[[paste0(time_label, "_Long_avg")]]
  short_avg_col <- df[[paste0(time_label, "_Short_avg")]]
  result <- data.frame(GeneID = rownames(df), 
                       Long_avg = long_avg_col, 
                       Short_avg = short_avg_col)
  return(result)
}

Egg_12h_avg <- extract_avg_columns(Egg_12h_processed, "Egg_12h")
Egg_24h_avg <- extract_avg_columns(Egg_24h_processed, "Egg_24h")
Egg_40h_avg <- extract_avg_columns(Egg_40h_processed, "Egg_40h")
Egg_56h_avg <- extract_avg_columns(Egg_56h_processed, "Egg_56h")
Egg_72h_avg <- extract_avg_columns(Egg_72h_processed, "Egg_72h")

long_avg_combined <- Egg_12h_avg %>%
  select(GeneID, Egg_12h_Long_avg = Long_avg) %>%
  left_join(select(Egg_24h_avg, GeneID, Egg_24h_Long_avg = Long_avg), by = "GeneID") %>%
  left_join(select(Egg_40h_avg, GeneID, Egg_40h_Long_avg = Long_avg), by = "GeneID") %>%
  left_join(select(Egg_56h_avg, GeneID, Egg_56h_Long_avg = Long_avg), by = "GeneID") %>%
  left_join(select(Egg_72h_avg, GeneID, Egg_72h_Long_avg = Long_avg), by = "GeneID")

short_avg_combined <- Egg_12h_avg %>%
  select(GeneID, Egg_12h_Short_avg = Short_avg) %>%
  left_join(select(Egg_24h_avg, GeneID, Egg_24h_Short_avg = Short_avg), by = "GeneID") %>%
  left_join(select(Egg_40h_avg, GeneID, Egg_40h_Short_avg = Short_avg), by = "GeneID") %>%
  left_join(select(Egg_56h_avg, GeneID, Egg_56h_Short_avg = Short_avg), by = "GeneID") %>%
  left_join(select(Egg_72h_avg, GeneID, Egg_72h_Short_avg = Short_avg), by = "GeneID")

rownames(long_avg_combined) <- long_avg_combined$GeneID
rownames(short_avg_combined) <- short_avg_combined$GeneID

long_avg_combined <- long_avg_combined[, -1] 
short_avg_combined <- short_avg_combined[, -1] 

long_avg_combined <- na.omit(long_avg_combined)
short_avg_combined <- na.omit(short_avg_combined)

long_avg_combined <- long_avg_combined[apply(long_avg_combined, 1, function(x) all(is.finite(x))), ]
short_avg_combined <- short_avg_combined[apply(short_avg_combined, 1, function(x) all(is.finite(x))), ]

cv_threshold <- 1

calculate_cv <- function(df) {
  row_sd <- apply(df, 1, sd)
  row_mean <- rowMeans(df)
  cv <- row_sd / row_mean
  return(cv)
}

long_cv <- calculate_cv(long_avg_combined)
long_avg_combined <- long_avg_combined[long_cv < cv_threshold, ]

short_cv <- calculate_cv(short_avg_combined)
short_avg_combined <- short_avg_combined[short_cv < cv_threshold, ]

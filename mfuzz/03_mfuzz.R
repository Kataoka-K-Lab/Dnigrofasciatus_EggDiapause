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

### *** ### *** ### *** ### *** ###

long_exp_set <- ExpressionSet(assayData = as.matrix(long_avg_combined))
short_exp_set <- ExpressionSet(assayData = as.matrix(short_avg_combined))

long_avg_combined_s <- standardise(long_exp_set)
short_avg_combined_s <- standardise(short_exp_set)


m_long <- mestimate(long_avg_combined_s) # 1.999423
m_short <- mestimate(short_avg_combined_s) # 1.999423

dmin_long <- Dmin(long_avg_combined_s, m = m_long, crange = seq(2, 50, 1), repeats = 3)
optimal_clusters_long <- which.min(dmin_long)

dmin_short <- Dmin(short_avg_combined_s, m = m_short, crange = seq(2, 50, 1), repeats = 3)
optimal_clusters_short <- which.min(dmin_short)
                                               
long_avg_combined_s_cl <- mfuzz(long_avg_combined_s, c = 20, m = m_long)
short_avg_combined_s_cl <- mfuzz(short_avg_combined_s, c = 20, m = m_short)

write.csv(long_avg_combined_s_cl$centers, file = "/Users/kataokak/Desktop/cluster_centers_long.csv")
write.csv(long_avg_combined_s_cl$size, file = "/Users/kataokak/Desktop/cluster_sizes_long.csv")
write.csv(long_avg_combined_s_cl$cluster, file = "/Users/kataokak/Desktop/clusters_long.csv")
write.csv(long_avg_combined_s_cl$membership, file = "/Users/kataokak/Desktop/cluster_memberships_long.csv")

write.csv(short_avg_combined_s_cl$centers, file = "/Users/kataokak/Desktop/cluster_centers_short.csv")
write.csv(short_avg_combined_s_cl$size, file = "/Users/kataokak/Desktop/cluster_sizes_short.csv")
write.csv(short_avg_combined_s_cl$cluster, file = "/Users/kataokak/Desktop/clusters_short.csv")
write.csv(short_avg_combined_s_cl$membership, file = "/Users/kataokak/Desktop/cluster_memberships_short.csv")

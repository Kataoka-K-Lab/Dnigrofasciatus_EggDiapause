library(dplyr)

# 90th and 10th percentile thresholds
upper_threshold <- quantile(significant_df$CosineSimilarity, 0.9)
lower_threshold <- quantile(significant_df$CosineSimilarity, 0.1)

filtered_df <- significant_df %>%
  filter(CosineSimilarity >= upper_threshold | CosineSimilarity <= lower_threshold)

short_annotation <- read.csv("/Users/kosukekataoka/Desktop/merged_annotation_short.csv")
long_annotation <- read.csv("/Users/kosukekataoka/Desktop/merged_annotation_long.csv")

combined_results <- data.frame()

for (i in 1:nrow(filtered_df)) {
  long_cluster <- as.integer(gsub("Long_", "", filtered_df$Long[i]))
  short_cluster <- as.integer(gsub("Short_", "", filtered_df$Short[i]))
  classification <- filtered_df$Classification[i]
  similarity <- filtered_df$CosineSimilarity[i]
  
  long_genes <- long_annotation %>% filter(cluster == long_cluster)
  
  short_genes <- short_annotation %>% filter(cluster == short_cluster)
  
  overlap_genes <- inner_join(long_genes, short_genes, by = "gene_id", suffix = c("_long", "_short"))
  
  overlap_genes$Cluster_Pair <- paste(filtered_df$Long[i], filtered_df$Short[i], classification, similarity, sep = "_")
  
  combined_results <- bind_rows(combined_results, overlap_genes)
}

print(combined_results)

write.csv(combined_results, "/Users/kosukekataoka/Desktop/combined_overlap_results.csv", row.names = FALSE)

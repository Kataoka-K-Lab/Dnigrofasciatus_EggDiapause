library(tidyverse)
library(reshape2)
library(pheatmap)

long_data <- read.csv("/Users/kataokak/Downloads/merged_annotation_long.csv")
short_data <- read.csv("/Users/kataokak/Downloads/merged_annotation_short.csv")

long_clusters <- split(long_data$gene_id, long_data$cluster)
short_clusters <- split(short_data$gene_id, short_data$cluster)

hypergeometric_test <- function(cluster1, cluster2, total_genes) {
  overlap <- length(intersect(cluster1, cluster2))
  m <- length(cluster1)
  n <- total_genes - m
  k <- length(cluster2)
  p_value <- phyper(overlap - 1, m, n, k, lower.tail = FALSE)
  return(p_value)
}

total_genes <- length(unique(c(long_data$gene_id, short_data$gene_id)))

p_matrix <- matrix(NA, nrow = length(long_clusters), ncol = length(short_clusters),
                   dimnames = list(paste0("Long_", names(long_clusters)), paste0("Short_", names(short_clusters))))

for (i in seq_along(long_clusters)) {
  for (j in seq_along(short_clusters)) {
    p_matrix[i, j] <- hypergeometric_test(long_clusters[[i]], short_clusters[[j]], total_genes)
  }
}

log_p_matrix <- -log10(p_matrix)

custom_colors <- c(colorRampPalette(c("white", "firebrick3"))(20), rep("firebrick3", 30))

hclust_long_ward <- hclust(dist(log_p_matrix), method = "ward.D2")
hclust_short_ward <- hclust(dist(t(log_p_matrix)), method = "ward.D2")

rownames(log_p_matrix) <- gsub("Long_", "", rownames(log_p_matrix))
colnames(log_p_matrix) <- gsub("Short_", "", colnames(log_p_matrix))

pheatmap(log_p_matrix, 
         cluster_rows = hclust_long_ward, 
         cluster_cols = hclust_short_ward, 
         color = custom_colors,
         breaks = seq(0, 50, length.out = 51),  
         main = "Cluster Overlap Significance (log10 p-values) with Ward's Method",
         angle_col = 0, 
         labels_col = colnames(log_p_matrix),
         labels_row = rownames(log_p_matrix),
         annotation_legend = TRUE,
         xlab = "Short", 
         ylab = "Long")

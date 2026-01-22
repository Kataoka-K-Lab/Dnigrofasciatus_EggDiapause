library(dplyr)
library(ggplot2)

short_centers <- read.csv("/Users/kosukekataoka/Desktop/cluster_centers_short.csv", row.names = 1)
long_centers <- read.csv("/Users/kosukekataoka/Desktop/cluster_centers_long.csv", row.names = 1)

rownames(short_centers) <- paste0("Short_", rownames(short_centers))
rownames(long_centers) <- paste0("Long_", rownames(long_centers))

cosine_similarity <- function(vec1, vec2) {
  dot_product <- sum(vec1 * vec2)
  norm_vec1 <- sqrt(sum(vec1^2))
  norm_vec2 <- sqrt(sum(vec2^2))
  return(dot_product / (norm_vec1 * norm_vec2))
}

classify_by_cosine_similarity <- function(short_profile, long_profile, threshold = 0.8) {
  similarity <- cosine_similarity(short_profile, long_profile)
  
  classification <- if (similarity >= threshold) "Homochronic" else "Heterochronic"
  
  return(list(classification = classification, cosine_similarity = similarity))
}

cluster_pairs <- expand.grid(Long = rownames(long_centers), Short = rownames(short_centers))
classification_results <- mapply(function(long, short) {
  long_profile <- as.numeric(long_centers[long, ])
  short_profile <- as.numeric(short_centers[short, ])
  
  classify_by_cosine_similarity(short_profile, long_profile)
}, cluster_pairs$Long, cluster_pairs$Short, SIMPLIFY = FALSE)

classification_df <- do.call(rbind, classification_results) %>% as.data.frame()
cluster_pairs$Classification <- classification_df$classification
cluster_pairs$CosineSimilarity <- as.numeric(classification_df$cosine_similarity)

significant_pairs <- which(p_matrix < 1e-10, arr.ind = TRUE)
significant_df <- data.frame(
  Long = rownames(p_matrix)[significant_pairs[, 1]],
  Short = colnames(p_matrix)[significant_pairs[, 2]]
)

significant_df <- significant_df %>%
  left_join(cluster_pairs, by = c("Long", "Short"))

print(significant_df)

summary(significant_df$CosineSimilarity)

ggplot(significant_df, aes(x = CosineSimilarity)) +
  geom_histogram(binwidth = 0.1, color = "black", fill = "skyblue") +
  labs(title = "Distribution of cosine similarity in significant_df",
       x = "Cosine Similarity",
       y = "Frequency") +
  theme_minimal()

significant_df$Classification <- as.character(significant_df$Classification)
significant_df$CosineSimilarity <- as.numeric(significant_df$CosineSimilarity)

write.csv(significant_df, "/Users/kosukekataoka/Desktop/significant_df_cosine_similarity.csv", row.names = FALSE)

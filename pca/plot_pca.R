library(plot3D)

data <- read.csv("/Users/kataokak/Downloads/merged_tpm_3dPCA.csv", row.names = 1, check.names = FALSE)

data_t <- t(data)

data_t <- data_t[, apply(data_t, 2, var) > 0]

pca_res <- prcomp(data_t, scale. = TRUE)

pca_df <- as.data.frame(pca_res$x[, 1:3])
pca_df$Sample <- rownames(pca_df)

pca_df$diapause <- gsub("([ND]+).*", "\\1", pca_df$Sample)
pca_df$time <- as.numeric(gsub("[^0-9]", "", pca_df$Sample))

color_map <- c("ND" = "red", "D" = "blue")
pch_map <- c("ND" = 17, "D" = 16)  # 17 = triangle, 16 = circle

pca_df$col <- color_map[pca_df$diapause]
pca_df$pch <- pch_map[pca_df$diapause]

xrange <- range(pca_df$PC1)
yrange <- range(pca_df$PC2)
zrange <- range(pca_df$PC3)

scatter3D(x = NULL, y = NULL, z = NULL,
          xlim = xrange, ylim = yrange, zlim = zrange,
          xlab = "PC1", ylab = "PC2", zlab = "PC3",
          colkey = FALSE, bty = "g")

for (i in 1:nrow(pca_df)) {
  points3D(pca_df$PC1[i], pca_df$PC2[i], pca_df$PC3[i],
           col = pca_df$col[i], pch = pca_df$pch[i],
           add = TRUE, cex = 1.5)
}

legend("topright", legend = c("Diapause", "Non-Diapause"),
       col = c("blue", "red"), pch = c(16, 17), inset = 0.02)

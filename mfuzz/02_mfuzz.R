long_exp_set <- ExpressionSet(assayData = as.matrix(long_avg_combined))
short_exp_set <- ExpressionSet(assayData = as.matrix(short_avg_combined))

long_avg_combined_s <- standardise(long_exp_set)
short_avg_combined_s <- standardise(short_exp_set)

m_long <- mestimate(long_avg_combined_s) # 2.001504
m_short <- mestimate(short_avg_combined_s) # 2.001821

long_avg_combined_s_cl <- mfuzz(long_avg_combined_s, c = 20, m = m_long)
short_avg_combined_s_cl <- mfuzz(short_avg_combined_s, c = 20, m = m_short)

pdf("/Users/kosukekataoka/Desktop/mfuzz.plot.long.pdf")
mfuzz.plot(long_avg_combined_s, cl = long_avg_combined_s_cl, mfrow=c(4, 5), time.labels = c(12, 24, 40, 56, 72), new.window = F)
dev.off()

pdf("/Users/kosukekataoka/Desktop/mfuzz.plot.short.pdf")
mfuzz.plot(short_avg_combined_s, cl = short_avg_combined_s_cl, mfrow=c(4, 5), time.labels = c(12, 24, 40, 56, 72), new.window = F)
dev.off()

write.csv(long_avg_combined_s_cl$centers, file = "/Users/kosukekataoka/Desktop/cluster_centers_long.csv")
write.csv(long_avg_combined_s_cl$size, file = "/Users/kosukekataoka/Desktop/cluster_sizes_long.csv")
write.csv(long_avg_combined_s_cl$cluster, file = "/Users/kosukekataoka/Desktop/clusters_long.csv")
write.csv(long_avg_combined_s_cl$membership, file = "/Users/kosukekataoka/Desktop/cluster_memberships_long.csv")

write.csv(short_avg_combined_s_cl$centers, file = "/Users/kosukekataoka/Desktop/cluster_centers_short.csv")
write.csv(short_avg_combined_s_cl$size, file = "/Users/kosukekataoka/Desktop/cluster_sizes_short.csv")
write.csv(short_avg_combined_s_cl$cluster, file = "/Users/kosukekataoka/Desktop/clusters_short.csv")
write.csv(short_avg_combined_s_cl$membership, file = "/Users/kosukekataoka/Desktop/cluster_memberships_short.csv")

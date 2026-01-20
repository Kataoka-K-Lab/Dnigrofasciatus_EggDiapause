pdf("/Users/kataokak/Desktop/mfuzz.plot.long.pdf")
mfuzz.plot(long_avg_combined_s, cl = long_avg_combined_s_cl, mfrow=c(4, 5), time.labels = c(12, 24, 40, 56, 72), new.window = F)
dev.off()

pdf("/Users/kataokak/Desktop/mfuzz.plot.short.pdf")
mfuzz.plot(short_avg_combined_s, cl = short_avg_combined_s_cl, mfrow=c(4, 5), time.labels = c(12, 24, 40, 56, 72), new.window = F)
dev.off()

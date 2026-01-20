library(DESeq2)
library(ggplot2)

## Egg - 12h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg_filter2/Egg_12h'
setwd(WORK_DIR)

countData <- as.matrix(read.csv("counts.csv", row.names="X", sep=","))

colData <- data.frame(
sample = c('Egg_12h_Long_2', 'Egg_12h_Long_4', 'Egg_12h_Long_5', 'Egg_12h_Short_1', 'Egg_12h_Short_3', 'Egg_12h_Short_5'),
condition = c('Non-diapause', 'Non-diapause', 'Non-diapause', 'Diapause', 'Diapause', 'Diapause'),
row.names = "sample")

columnList <- c('Egg_12h_Long_2', 'Egg_12h_Long_4', 'Egg_12h_Long_5', 'Egg_12h_Short_1', 'Egg_12h_Short_3', 'Egg_12h_Short_5')
countData <- countData[, columnList]

dds <- DESeqDataSetFromMatrix(countData = round(countData), colData = colData, design = ~ condition)
dds <- dds[rowSums(counts(dds)) >= 10,]
dds$condition <- relevel(dds$condition, ref = "Non-diapause")
dds <- DESeq(dds)
res <- results(dds)

normalized_counts <- counts(dds, normalized=TRUE)
# head(normalized_counts)
write.csv(as.data.frame(normalized_counts), file="deseq_normalized_counts.csv")

# write.csv(as.data.frame(res[order(res$padj),]), file="result_padj_ordered.csv")

## Egg - 24h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg_filter2/Egg_24h'
setwd(WORK_DIR)

countData <- as.matrix(read.csv("counts.csv", row.names="X", sep=","))

colData <- data.frame(
sample = c('Egg_24h_Long_3', 'Egg_24h_Long_4', 'Egg_24h_Long_5', 'Egg_24h_Long_6', 'Egg_24h_Short_2', 'Egg_24h_Short_5', 'Egg_24h_Short_6'),
condition = c('Non-diapause', 'Non-diapause', 'Non-diapause', 'Non-diapause', 'Diapause', 'Diapause', 'Diapause'),
row.names = "sample")

columnList <- c('Egg_24h_Long_3', 'Egg_24h_Long_4', 'Egg_24h_Long_5', 'Egg_24h_Long_6', 'Egg_24h_Short_2', 'Egg_24h_Short_5', 'Egg_24h_Short_6')
countData <- countData[, columnList]

dds <- DESeqDataSetFromMatrix(countData = round(countData), colData = colData, design = ~ condition)
dds <- dds[rowSums(counts(dds)) >= 10,]
dds$condition <- relevel(dds$condition, ref = "Non-diapause")
dds <- DESeq(dds)
res <- results(dds)

normalized_counts <- counts(dds, normalized=TRUE)
# head(normalized_counts)
write.csv(as.data.frame(normalized_counts), file="deseq_normalized_counts.csv")

# write.csv(as.data.frame(res[order(res$padj),]), file="result_padj_ordered.csv")

## Egg - 40h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg_filter2/Egg_40h'
setwd(WORK_DIR)

countData <- as.matrix(read.csv("counts.csv", row.names="X", sep=","))

colData <- data.frame(
sample = c('Egg_40h_Long_1', 'Egg_40h_Long_2', 'Egg_40h_Long_3', 'Egg_40h_Short_3', 'Egg_40h_Short_4', 'Egg_40h_Short_5'),
condition = c('Non-diapause', 'Non-diapause', 'Non-diapause', 'Diapause', 'Diapause', 'Diapause'),
row.names = "sample")

columnList <- c('Egg_40h_Long_1', 'Egg_40h_Long_2', 'Egg_40h_Long_3', 'Egg_40h_Short_3', 'Egg_40h_Short_4', 'Egg_40h_Short_5')
countData <- countData[, columnList]

dds <- DESeqDataSetFromMatrix(countData = round(countData), colData = colData, design = ~ condition)
dds <- dds[rowSums(counts(dds)) >= 10,]
dds$condition <- relevel(dds$condition, ref = "Non-diapause")
dds <- DESeq(dds)
res <- results(dds)

normalized_counts <- counts(dds, normalized=TRUE)
# head(normalized_counts)
write.csv(as.data.frame(normalized_counts), file="deseq_normalized_counts.csv")

# write.csv(as.data.frame(res[order(res$padj),]), file="result_padj_ordered.csv")

## Egg - 56h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg_filter2/Egg_56h'
setwd(WORK_DIR)

countData <- as.matrix(read.csv("counts.csv", row.names="X", sep=","))

colData <- data.frame(
sample = c('Egg_56h_Long_1', 'Egg_56h_Long_2', 'Egg_56h_Long_3', 'Egg_56h_Short_2', 'Egg_56h_Short_3', 'Egg_56h_Short_4', 'Egg_56h_Short_5'),
condition = c('Non-diapause', 'Non-diapause', 'Non-diapause', 'Diapause', 'Diapause', 'Diapause', 'Diapause'),
row.names = "sample")

columnList <- c('Egg_56h_Long_1', 'Egg_56h_Long_2', 'Egg_56h_Long_3', 'Egg_56h_Short_2', 'Egg_56h_Short_3', 'Egg_56h_Short_4', 'Egg_56h_Short_5')
countData <- countData[, columnList]

dds <- DESeqDataSetFromMatrix(countData = round(countData), colData = colData, design = ~ condition)
dds <- dds[rowSums(counts(dds)) >= 10,]
dds$condition <- relevel(dds$condition, ref = "Non-diapause")
dds <- DESeq(dds)
res <- results(dds)

normalized_counts <- counts(dds, normalized=TRUE)
# head(normalized_counts)
write.csv(as.data.frame(normalized_counts), file="deseq_normalized_counts.csv")

# write.csv(as.data.frame(res[order(res$padj),]), file="result_padj_ordered.csv")

## Egg - 72h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg_filter2/Egg_72h'
setwd(WORK_DIR)

countData <- as.matrix(read.csv("counts.csv", row.names="X", sep=","))

colData <- data.frame(
sample = c('Egg_72h_Long_2', 'Egg_72h_Long_3', 'Egg_72h_Long_4', 'Egg_72h_Long_5', 'Egg_72h_Long_6', 'Egg_72h_Short_2', 'Egg_72h_Short_3', 'Egg_72h_Short_5', 'Egg_72h_Short_6', 'Egg_72h_Short_7'),
condition = c('Non-diapause', 'Non-diapause', 'Non-diapause', 'Non-diapause', 'Non-diapause', 'Diapause', 'Diapause', 'Diapause', 'Diapause', 'Diapause'),
row.names = "sample")

columnList <- c('Egg_72h_Long_2', 'Egg_72h_Long_3', 'Egg_72h_Long_4', 'Egg_72h_Long_5', 'Egg_72h_Long_6', 'Egg_72h_Short_2', 'Egg_72h_Short_3', 'Egg_72h_Short_5', 'Egg_72h_Short_6', 'Egg_72h_Short_7')
countData <- countData[, columnList]

dds <- DESeqDataSetFromMatrix(countData = round(countData), colData = colData, design = ~ condition)
dds <- dds[rowSums(counts(dds)) >= 10,]
dds$condition <- relevel(dds$condition, ref = "Non-diapause")
dds <- DESeq(dds)
res <- results(dds)

normalized_counts <- counts(dds, normalized=TRUE)
# head(normalized_counts)
write.csv(as.data.frame(normalized_counts), file="deseq_normalized_counts.csv")

# write.csv(as.data.frame(res[order(res$padj),]), file="result_padj_ordered.csv")

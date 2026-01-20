library(tximport)
library(jsonlite)
library(readr)

## Egg - all

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_12h_Long_2', 'Egg_12h_Long_4', 'Egg_12h_Long_5', 'Egg_12h_Long_6', 'Egg_12h_Short_1', 'Egg_12h_Short_2', 'Egg_12h_Short_3', 'Egg_12h_Short_5', 'Egg_24h_Long_3', 'Egg_24h_Long_4', 'Egg_24h_Long_5', 'Egg_24h_Long_6', 'Egg_24h_Short_2', 'Egg_24h_Short_3', 'Egg_24h_Short_5', 'Egg_24h_Short_6', 'Egg_40h_Long_1', 'Egg_40h_Long_2', 'Egg_40h_Long_3', 'Egg_40h_Long_5', 'Egg_40h_Short_1', 'Egg_40h_Short_3', 'Egg_40h_Short_4', 'Egg_40h_Short_5', 'Egg_56h_Long_1', 'Egg_56h_Long_2', 'Egg_56h_Long_3', 'Egg_56h_Long_4', 'Egg_56h_Short_2', 'Egg_56h_Short_3', 'Egg_56h_Short_4', 'Egg_56h_Short_5', 'Egg_72h_Long_2', 'Egg_72h_Long_3', 'Egg_72h_Long_4', 'Egg_72h_Long_5', 'Egg_72h_Long_6', 'Egg_72h_Short_2', 'Egg_72h_Short_3', 'Egg_72h_Short_5', 'Egg_72h_Short_6', 'Egg_72h_Short_7')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

## Egg - 12h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg/Egg_12h'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_12h_Long_2', 'Egg_12h_Long_4', 'Egg_12h_Long_5', 'Egg_12h_Long_6', 'Egg_12h_Short_1', 'Egg_12h_Short_2', 'Egg_12h_Short_3', 'Egg_12h_Short_5')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

## Egg - 24h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg/Egg_24h'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_24h_Long_3', 'Egg_24h_Long_4', 'Egg_24h_Long_5', 'Egg_24h_Long_6', 'Egg_24h_Short_2', 'Egg_24h_Short_3', 'Egg_24h_Short_5', 'Egg_24h_Short_6')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

## Egg - 40h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg/Egg_40h'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_40h_Long_1', 'Egg_40h_Long_2', 'Egg_40h_Long_3', 'Egg_40h_Long_5', 'Egg_40h_Short_1', 'Egg_40h_Short_3', 'Egg_40h_Short_4', 'Egg_40h_Short_5')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

## Egg - 56h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg/Egg_56h'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_56h_Long_1', 'Egg_56h_Long_2', 'Egg_56h_Long_3', 'Egg_56h_Long_4', 'Egg_56h_Short_2', 'Egg_56h_Short_3', 'Egg_56h_Short_4', 'Egg_56h_Short_5')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

## Egg - 72h

WORK_DIR='/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data/egg/Egg_72h'
setwd(WORK_DIR)

salmon.files <- file.path(list.files('.', pattern = 'exp_salmon'), 'quant.sf')
names(salmon.files) <- c('Egg_72h_Long_2', 'Egg_72h_Long_3', 'Egg_72h_Long_4', 'Egg_72h_Long_5', 'Egg_72h_Long_6', 'Egg_72h_Short_2', 'Egg_72h_Short_3', 'Egg_72h_Short_5', 'Egg_72h_Short_6', 'Egg_72h_Short_7')
tx.exp <- tximport(salmon.files, type = "salmon", txOut = TRUE)

write.csv(tx.exp$abundance, file = "tpm.csv", row.names = TRUE)
write.csv(tx.exp$counts, file = "counts.csv", row.names = TRUE)

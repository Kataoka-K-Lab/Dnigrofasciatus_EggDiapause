#!/bin/bash -f
#PBS -l nodes=1:ppn=40:cosmos
#PBS -q cosmos
#PBS -N gemomaERE
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

source ~/.bashrc
conda activate gemoma

cd /work3/kataoka/madarasuzu/gemoma

GeMoMa ERE s=FR_UNSTRANDED outdir=/work3/kataoka/madarasuzu/gemoma \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Long_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Short_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Brain_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Long_6/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Short_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_12h_Short_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Long_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Long_6/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Short_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_24h_Short_6/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Long_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Long_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Short_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Short_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_40h_Short_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Long_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Short_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_56h_Short_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Long_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Long_6/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Short_5/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Short_6/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Egg_72h_Short_7/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Long_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Long_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Long_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Long_4/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Short_1/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Short_2/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Short_3/hisat2.db.bam \
m=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2/Ovary_Short_4/hisat2.db.bam

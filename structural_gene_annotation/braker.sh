sudo docker run \
-v /Users/kosukekataoka/work1/madarasuzu/braker3/wd230425:/wd230425 \
-v /Volumes/volume1/crickets/madarasuzu:/genome \
-v /Volumes/volume1/db:/db \
-v /Volumes/volume1/crickets/madarasuzu/rnaseq/all_data_hisat2:/all_data_hisat2 \
--user 1000:100 --rm -it \
teambraker/braker3:latest bash

work_dir=/wd230425
genome=/genome/masurca405_ph_hirise.sm.fa
prot_seq=/db/odb10_arthropoda_all.fasta 
threads=40

braker.pl \
--genome=$genome \
--prot_seq=$prot_seq \
--workingdir=$work_dir \
--threads $threads \
--bam=/all_data_hisat2/Brain_Long_1/hisat2.db.bam,\
/all_data_hisat2/Brain_Long_2/hisat2.db.bam,\
/all_data_hisat2/Brain_Long_3/hisat2.db.bam,\
/all_data_hisat2/Brain_Long_4/hisat2.db.bam,\
/all_data_hisat2/Brain_Short_1/hisat2.db.bam,\
/all_data_hisat2/Brain_Short_2/hisat2.db.bam,\
/all_data_hisat2/Brain_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Long_2/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Long_4/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Long_6/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Short_1/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Short_2/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_12h_Short_5/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Long_3/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Long_4/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Long_5/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Long_6/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Short_2/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Short_5/hisat2.db.bam,\
/all_data_hisat2/Egg_24h_Short_6/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Long_1/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Long_2/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Long_3/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Long_5/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Short_1/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Short_4/hisat2.db.bam,\
/all_data_hisat2/Egg_40h_Short_5/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Long_1/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Long_2/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Long_3/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Long_4/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Short_2/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Short_4/hisat2.db.bam,\
/all_data_hisat2/Egg_56h_Short_5/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Long_2/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Long_3/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Long_4/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Long_5/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Long_6/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Short_2/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Short_3/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Short_5/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Short_6/hisat2.db.bam,\
/all_data_hisat2/Egg_72h_Short_7/hisat2.db.bam,\
/all_data_hisat2/Ovary_Long_1/hisat2.db.bam,\
/all_data_hisat2/Ovary_Long_2/hisat2.db.bam,\
/all_data_hisat2/Ovary_Long_3/hisat2.db.bam,\
/all_data_hisat2/Ovary_Long_4/hisat2.db.bam,\
/all_data_hisat2/Ovary_Short_1/hisat2.db.bam,\
/all_data_hisat2/Ovary_Short_2/hisat2.db.bam,\
/all_data_hisat2/Ovary_Short_3/hisat2.db.bam,\
/all_data_hisat2/Ovary_Short_4/hisat2.db.bam > /wd230425/braker3_out

work_dir=/Volumes/volume1/crickets/madarasuzu/rnaseq/salmon/240710_all_data
cdna_ref=/Volumes/volume1/crickets/madarasuzu/Dnig_genes_v1.3/Dnig_genes_v1.3.UTR.longest_isoform.cDNA.fa
fq_in=/Volumes/volume1/rnaseq/madarasuzu/after_qc
threads=20
suffix=fq.gz

## Salmon - eggs ##

cd $work_dir
mkdir egg && cd egg

sample_name=(
Egg_12h_Long_2
Egg_12h_Long_4
Egg_12h_Long_5
Egg_12h_Long_6
Egg_12h_Short_1
Egg_12h_Short_2
Egg_12h_Short_3
Egg_12h_Short_5
Egg_24h_Long_3
Egg_24h_Long_4
Egg_24h_Long_5
Egg_24h_Long_6
Egg_24h_Short_2
Egg_24h_Short_3
Egg_24h_Short_5
Egg_24h_Short_6
Egg_40h_Long_1
Egg_40h_Long_2
Egg_40h_Long_3
Egg_40h_Long_5
Egg_40h_Short_1
Egg_40h_Short_3
Egg_40h_Short_4
Egg_40h_Short_5
Egg_56h_Long_1
Egg_56h_Long_2
Egg_56h_Long_3
Egg_56h_Long_4
Egg_56h_Short_2
Egg_56h_Short_3
Egg_56h_Short_4
Egg_56h_Short_5
Egg_72h_Long_2
Egg_72h_Long_3
Egg_72h_Long_4
Egg_72h_Long_5
Egg_72h_Long_6
Egg_72h_Short_2
Egg_72h_Short_3
Egg_72h_Short_5
Egg_72h_Short_6
Egg_72h_Short_7
)
suffix=fq

salmon index \
-p $threads \
-t $cdna_ref \
-i salmon_index

for i in ${sample_name[@]}; do \
salmon quant \
-i salmon_index \
-l A \
-p $threads \
-1 ${fq_in}/${i}_R1.$suffix \
-2 ${fq_in}/${i}_R2.$suffix \
--output ${i}_exp_salmon; done

#!/bin/bash -f
#PBS -l nodes=1:ppn=40:cosmos
#PBS -q cosmos
#PBS -N stringtie
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

### Setting ###

work_dir=/work3/kataoka/madarasuzu/stringtie2
genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.fa.masked
input_dir=/work3/kataoka/madarasuzu/rnaseq/all_data_hisat2
threads=40
transdecoder_home=/work2/kataoka/TransDecoder

input_name=(
Brain_Long_1
Brain_Long_2
Brain_Long_3
Brain_Long_4
Brain_Short_1
Brain_Short_2
Brain_Short_3
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
Ovary_Long_1
Ovary_Long_2
Ovary_Long_3
Ovary_Long_4
Ovary_Short_1
Ovary_Short_2
Ovary_Short_3
Ovary_Short_4
)

source ~/.bashrc
conda activate rnaseq

### Stringtie2 - assembly ###

cd $work_dir && mkdir assembly && cd assembly

for i in ${input_name[@]}; do

stringtie \
-p $threads \
-o $work_dir/assembly/${i}.gtf \
$input_dir/${i}/hisat2.db.bam

done

## Stringtie2 - merge ##

cd $work_dir && mkdir merge && cd merge

merge=`for i in ${input_name[@]}; do echo ../assembly/${i}.gtf; done`

stringtie --merge \
-o stringtie_merged.gtf \
$merge

merge_gtf=$work_dir/merge/stringtie_merged.gtf

### Transdecoder ###

conda activate

export PERL5LIB=/home/kataoka/miniconda3/lib/site_perl/5.26.2:$PERL5LIB
export PERL5LIB=/home/kataoka/miniconda3/lib/site_perl/5.26.0:$PERL5LIB

cd $work_dir

$transdecoder_home/util/gtf_genome_to_cdna_fasta.pl \
$merge_gtf \
$genome > $merge_gtf.fasta

$transdecoder_home/util/gtf_to_alignment_gff3.pl \
$merge_gtf > $merge_gtf.gff3

TransDecoder.LongOrfs -t $merge_gtf.fasta

TransDecoder.Predict -t $merge_gtf.fasta

$transdecoder_home/util/cdna_alignment_orf_to_genome_orf.pl \
$work_dir/stringtie_merged.gtf.fasta.transdecoder.gff3 \
$work_dir/merge/stringtie_merged.gtf.gff3 \
$work_dir/merge/stringtie_merged.gtf.fasta \
> $work_dir/merge/stringtie_merged.gtf.fasta.transdecoder.genome.gff3

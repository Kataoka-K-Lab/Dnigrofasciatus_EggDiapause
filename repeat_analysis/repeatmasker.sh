#!/bin/bash -f

#PBS -S /bin/bash
#PBS -l nodes=1:ppn=20:cosmos
#PBS -q cosmos
#PBS -N repeatmasker
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

work_dir=/work2/kataoka/madarasuzu/repeatmasker
input_genome=/work2/kataoka/madarasuzu/hirise/masurca405_ph_hirise.fa
lib=/work2/kataoka/madarasuzu/repeatmodeler2_raw/RM_114994.SatJan141436252023/consensi.fa.classified
threads=20

export PERL5LIB=/home/kataoka/miniconda3/lib/perl5/site_perl:$PERL5LIB

cd $work_dir

/usr/bin/perl /home/kataoka/work/RepeatMasker/RepeatMasker \
$input_genome \
-lib $lib \
-pa $threads \
-xsmall \
-gff -a -s -html \
-dir $work_dir

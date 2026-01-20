#!/bin/bash -f
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N Purge_Haplotigs
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/purgehaplotigs
FASTA_IN=/work2/kataoka/madarasuzu/masurca/CA.mr.99.17.15.0.02/primary.genome.scf.fasta
#ONT_READ=/work2/korogi/Madarasuzu/ont_seq/madarasuzu_ontseq.fastq
THREADS=10

source ~/.bashrc
conda activate purge_haplotigs_env

## Purge Haplotigs Histogram ##

cd $WORK_DIR

purge_haplotigs hist \
-b out_sorted.SR.bam \
-g $FASTA_IN \
-t $THREADS


# nohup purge_haplotigs hist \
# -b out_sorted.SR.bam \
# -g $FASTA_IN \
# -t $THREADS > purge_haplotigs_hist.err &

samtools depth -a out_sorted.SR.bam | awk '{c++;s+=$3}END{print s/c}'
#  94.4881

purge_haplotigs cov \
-i out_sorted.SR.bam.gencov \
-l 5 \
-m 70 \
-h 190 \
-j 101 

purge_haplotigs purge \
-g $FASTA_IN \
-c coverage_stats.csv \
-t 20

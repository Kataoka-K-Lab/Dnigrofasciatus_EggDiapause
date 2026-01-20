#!/bin/bash -f
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N Purge_Haplotigs
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/purgehaplotigs
FASTA_IN=/work2/kataoka/madarasuzu/masurca/CA.mr.99.17.15.0.02/primary.genome.scf.fasta
ONT_READ=/work2/korogi/Madarasuzu/ont_seq/madarasuzu_ontseq.fastq
THREADS=20

source ~/.bashrc
conda activate purge_haplotigs_env

## Purge Haplotigs Histogram ##

cd $WORK_DIR

purge_haplotigs hist \
-b out_sorted.bam \
-g $FASTA_IN \
-t $THREADS

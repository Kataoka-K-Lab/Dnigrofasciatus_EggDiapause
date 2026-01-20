#!/bin/bash -f
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N minimap2
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/purgehaplotigs/minimap2
GENOME_IN=/work2/kataoka/madarasuzu/purgehaplotigs/curated.fasta
FQ_1=/work2/korogi/RH22084589/rawdata/Dnig_R1.fq.gz
FQ_2=/work2/korogi/RH22084589/rawdata/Dnig_R2.fq.gz
THREADS=20

cd $WORK_DIR

minimap2 \
-ax sr \
-t $THREADS \
$GENOME_IN \
$FQ_1 \
$FQ_2 > aln.sam

samtools sort -@ $THREADS -O bam -o aln.bam aln.sam

samtools index aln.bam

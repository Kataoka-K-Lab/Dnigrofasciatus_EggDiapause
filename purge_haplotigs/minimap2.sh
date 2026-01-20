#!/bin/bash -f
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N minimap2
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/purgehaplotigs
FASTA_IN=/work2/kataoka/madarasuzu/masurca/CA.mr.99.17.15.0.02/primary.genome.scf.fasta
ONT_READ=/work2/korogi/Madarasuzu/ont_seq/madarasuzu_ontseq.fastq
THREADS=20

source ~/.bashrc
conda activate racon

## minimap2 ##

cd $WORK_DIR

minimap2 \
-t $THREADS \
-ax sr \
$FASTA_IN \
$ONT_READ \
--secondary=no \
> out.sam

samtools view -b \
--threads $THREADS \
-o out.bam \
out.sam

samtools sort \
-o out_sorted.bam \
--threads $THREADS \
out.bam

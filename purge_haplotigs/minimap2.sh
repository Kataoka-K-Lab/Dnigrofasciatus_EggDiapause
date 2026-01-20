#!/bin/bash -f
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N minimap2
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/purgehaplotigs
FASTA_IN=/work2/kataoka/madarasuzu/masurca/CA.mr.99.17.15.0.02/primary.genome.scf.fasta
#ONT_READ=/work2/korogi/Madarasuzu/ont_seq/madarasuzu_ontseq.fastq
FQ_1=/work2/korogi/RH22084589/rawdata/Dnig_R1.fq.gz
FQ_2=/work2/korogi/RH22084589/rawdata/Dnig_R2.fq.gz
THREADS=20

source ~/.bashrc
conda activate racon

## minimap2 ##

cd $WORK_DIR

minimap2 \
-t $THREADS \
-ax sr \
$FASTA_IN \
$FQ_1 $FQ_2 \
> out.SR.sam

samtools view -b \
--threads $THREADS \
-o out.SR.bam \
out.SR.sam

samtools sort \
-o out_sorted.SR.bam \
--threads $THREADS \
out.SR.bam

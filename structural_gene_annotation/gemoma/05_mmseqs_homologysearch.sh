#!/bin/bash -f
#PBS -l nodes=1:ppn=40:cosmos
#PBS -q cosmos
#PBS -N mmseqs
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

source ~/.bashrc
conda activate gemoma

cd /work3/kataoka/madarasuzu/gemoma

## Homology search

# Tribolium_castaneum

mkdir mmseqs_out_tcas

mmseqs search \
mmseqs_query_tcas/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_tcas/mmseqs.out \
mmseqs_out_tcas/mmseqs_tmp \
-e 100.0 \
--threads 40 \
-s 8.5 \
-a \
--comp-bias-corr 0 \
--max-seqs 500 \
--mask 0 \
--orf-start-mode 1 \
-v 2

# Drosophila_melanogaster

mkdir mmseqs_out_dmel

mmseqs search \
mmseqs_query_dmel/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_dmel/mmseqs.out \
mmseqs_out_dmel/mmseqs_tmp \
-e 100.0 \
--threads 40 \
-s 8.5 \
-a \
--comp-bias-corr 0 \
--max-seqs 500 \
--mask 0 \
--orf-start-mode 1 \
-v 2

# Apis_mellifera

mkdir mmseqs_out_amel

mmseqs search \
mmseqs_query_amel/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_amel/mmseqs.out \
mmseqs_out_amel/mmseqs_tmp \
-e 100.0 \
--threads 40 \
-s 8.5 \
-a \
--comp-bias-corr 0 \
--max-seqs 500 \
--mask 0 \
--orf-start-mode 1 \
-v 2

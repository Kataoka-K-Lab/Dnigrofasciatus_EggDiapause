#!/bin/bash -f
#PBS -l nodes=1:ppn=40:cosmos
#PBS -q cosmos
#PBS -N GeMoMa_GMM
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

source ~/.bashrc
conda activate gemoma

genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.sm.fa
outdir=/work3/kataoka/madarasuzu/gemoma

# Tribolium_castaneum

cd $outdir && mkdir GeMoMa_GMM_tcas

GeMoMa -Xmx100G GeMoMa \
s=$outdir/mmseqs_out_tcas/search.txt \
c=$outdir/tcas/cds-parts.fasta \
a=$outdir/tcas/assignment.tabular \
t=$genome \
sort=true \
Score=ReAlign \
i=$outdir/denoised_introns.gff \
coverage=UNSTRANDED \
coverage_unstranded=$outdir/coverage.bedgraph \
outdir=GeMoMa_GMM_tcas

# Drosophila_melanogaster

cd $outdir && mkdir GeMoMa_GMM_dmel

GeMoMa -Xmx100G GeMoMa \
s=$outdir/mmseqs_out_dmel/search.txt \
c=$outdir/dmel/cds-parts.fasta \
a=$outdir/dmel/assignment.tabular \
t=$genome \
sort=true \
Score=ReAlign \
i=$outdir/denoised_introns.gff \
coverage=UNSTRANDED \
coverage_unstranded=$outdir/coverage.bedgraph \
outdir=GeMoMa_GMM_dmel

# Apis_mellifera

cd $outdir && mkdir GeMoMa_GMM_amel

GeMoMa -Xmx100G GeMoMa \
s=$outdir/mmseqs_out_amel/search.txt \
c=$outdir/amel/cds-parts.fasta \
a=$outdir/amel/assignment.tabular \
t=$genome \
sort=true \
Score=ReAlign \
i=$outdir/denoised_introns.gff \
coverage=UNSTRANDED \
coverage_unstranded=$outdir/coverage.bedgraph \
outdir=GeMoMa_GMM_amel

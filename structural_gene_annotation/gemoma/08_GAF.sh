#!/bin/bash -f
#PBS -l nodes=1:ppn=1:cosmos
#PBS -q cosmos
#PBS -N GeMoMa_GAF
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

source ~/.bashrc
conda activate gemoma

genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.sm.fa
outdir=/work3/kataoka/madarasuzu/gemoma

# Tribolium_castaneum

cd $outdir && mkdir GeMoMa_GAF_tcas

GeMoMa -Xmx100G GAF g=$outdir/GeMoMa_GMM_tcas/predicted_annotation.gff outdir=$outdir/GeMoMa_GAF_tcas

# Drosophila_melanogaster

cd $outdir && mkdir GeMoMa_GAF_dmel

GeMoMa -Xmx100G GAF g=$outdir/GeMoMa_GMM_dmel/predicted_annotation.gff outdir=$outdir/GeMoMa_GAF_dmel

# Apis_mellifera

cd $outdir && mkdir GeMoMa_GAF_amel

GeMoMa -Xmx100G GAF g=$outdir/GeMoMa_GMM_amel/predicted_annotation.gff outdir=$outdir/GeMoMa_GAF_amel

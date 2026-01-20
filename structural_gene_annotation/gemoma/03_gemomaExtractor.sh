conda activate gemoma

genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.fa.masked
outdir=/work3/kataoka/madarasuzu/gemoma

# Tribolium_castaneum
outdir_tcas=tcas
ref_ann_tcas=/work3/kataoka/madarasuzu/gemoma/ref/Tribolium_castaneum.Tcas5.2.56.chr.gff3.gz
ref_genome_tcas=/work3/kataoka/madarasuzu/gemoma/ref/Tribolium_castaneum.Tcas5.2.dna.toplevel.fa.gz
GeMoMa Extractor a=$ref_ann_tcas g=$ref_genome_tcas outdir=$outdir/$outdir_tcas > tcas_gemoma_extractor.out 2>&1

# Drosophila_melanogaster
outdir_dmel=dmel
ref_ann_dmel=/work3/kataoka/madarasuzu/gemoma/ref/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.gff.gz
ref_genome_dmel=/work3/kataoka/madarasuzu/gemoma/ref/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz
GeMoMa Extractor a=$ref_ann_dmel g=$ref_genome_dmel outdir=$outdir/$outdir_dmel > dmel_gemoma_extractor.out 2>&1

# Apis_mellifera
outdir_amel=amel
ref_ann_amel=/work3/kataoka/madarasuzu/gemoma/ref/GCF_003254395.2_Amel_HAv3.1_genomic.gff.gz
ref_genome_amel=/work3/kataoka/madarasuzu/gemoma/ref/GCF_003254395.2_Amel_HAv3.1_genomic.fna.gz
GeMoMa Extractor a=$ref_ann_amel g=$ref_genome_amel outdir=$outdir/$outdir_amel > amel_gemoma_extractor.out 2>&1

genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.fa.masked

mkdir mmseqs_target && mmseqs createdb $genome mmseqs_target/GenomeDB -v 2

# Tribolium_castaneum

mkdir mmseqs_query_tcas && mmseqs createdb \
tcas/cds-parts.fasta \
mmseqs_query_tcas/cdsDB \
-v 2

# Drosophila_melanogaster

mkdir mmseqs_query_dmel && mmseqs createdb \
dmel/cds-parts.fasta \
mmseqs_query_dmel/cdsDB \
-v 2

# Apis_mellifera

mkdir mmseqs_query_amel && mmseqs createdb \
amel/cds-parts.fasta \
mmseqs_query_amel/cdsDB \
-v 2

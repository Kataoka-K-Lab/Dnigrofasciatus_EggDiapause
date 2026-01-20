agat_sp_keep_longest_isoform.pl -gff Dnig_genes_v1.3.UTR.agat.gff3 -o Dnig_genes_v1.3.UTR.agat.longest_isoform.gff3
agat_convert_sp_gff2gtf.pl --gff Dnig_genes_v1.3.UTR.agat.longest_isoform.gff3 -o Dnig_genes_v1.3.UTR.agat.longest_isoform.gtf

GFF3=Dnig_genes_v1.3.UTR.agat.longest_isoform.gff3
GENOME_IN=Dnig_v1.0.genome.fa
CDNA=Dnig_genes_v1.3.UTR.longest_isoform.cDNA.fa
CDS=Dnig_genes_v1.3.UTR.longest_isoform.CDS.fa
PROTEIN=Dnig_genes_v1.3.UTR.longest_isoform.pep.fa

gffread $GFF3 \
-g $GENOME_IN \
-w $CDNA \
-x $CDS \
-y $PROTEIN

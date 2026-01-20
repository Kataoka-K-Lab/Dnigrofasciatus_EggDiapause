FASTA=/Volumes/external1/projects/madarasuzu/curated.fasta
BAM_IN=/Volumes/external1/projects/madarasuzu/blobtools/aln.bam
BLAST_OUT=/Volumes/external1/projects/madarasuzu/megablast/curated.fasta.vs.nt.megablast.out
BLOBTOOLS=/Users/kataokak/work/tools/blobtools/blobtools

$BLOBTOOLS create \
-i $FASTA \
-b $BAM_IN \
-t $BLAST_OUT \
-o blobtools_create_out

$BLOBTOOLS view -i blobtools_create_out.blobDB.json

$BLOBTOOLS plot -i blobtools_create_out.blobDB.json

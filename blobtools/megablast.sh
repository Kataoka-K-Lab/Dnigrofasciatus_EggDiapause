FASTA=/Volumes/external1/projects/madarasuzu/curated.fasta
FATSA_NAME=curated.fasta
WOR_DIR=/Volumes/external1/projects/madarasuzu/megablast

#mkdir $WOR_DIR
cd $WOR_DIR && ln -s $FASTA

blastn \
-query ${FATSA_NAME} \
-task megablast \
-db nt \
-outfmt '6 qseqid staxids bitscore std sscinames sskingdoms stitle' \
-culling_limit 10 \
-num_threads 20 \
-evalue 1e-25 \
-out ${FATSA_NAME}.vs.nt.megablast.out

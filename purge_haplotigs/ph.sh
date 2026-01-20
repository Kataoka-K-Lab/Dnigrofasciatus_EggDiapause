GENOME_FASTA=/Volumes/volume1/crickets/madarasuzu/masurca405/primary.genome.scf.fasta
#READS=/Users/kosukekataoka/work1/tagame_genome/data/passed_all.fastq.gz
BAM=/Volumes/volume1/crickets/madarasuzu/purgehaplotigs/out_sorted.bam
THREADS=24

purge_haplotigs hist \
-b $BAM \
-g $GENOME_FASTA \
-t $THREADS

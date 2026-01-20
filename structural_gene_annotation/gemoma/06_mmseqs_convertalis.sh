# Tribolium_castaneum

mmseqs convertalis \
mmseqs_query_tcas/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_tcas/mmseqs.out \
mmseqs_out_tcas/search.txt \
--threads 6 \
--format-output "query,target,pident,alnlen,mismatch,gapopen,qstart,qend,tstart,tend,evalue,bits,empty,raw,nident,empty,empty,empty,qframe,tframe,qaln,taln,qlen,tlen" \
-v 2

# Drosophila_melanogaster

mmseqs convertalis \
mmseqs_query_dmel/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_dmel/mmseqs.out \
mmseqs_out_dmel/search.txt \
--threads 6 \
--format-output "query,target,pident,alnlen,mismatch,gapopen,qstart,qend,tstart,tend,evalue,bits,empty,raw,nident,empty,empty,empty,qframe,tframe,qaln,taln,qlen,tlen" \
-v 2

# Apis_mellifera

mmseqs convertalis \
mmseqs_query_amel/cdsDB \
mmseqs_target/GenomeDB \
mmseqs_out_amel/mmseqs.out \
mmseqs_out_amel/search.txt \
--threads 6 \
--format-output "query,target,pident,alnlen,mismatch,gapopen,qstart,qend,tstart,tend,evalue,bits,empty,raw,nident,empty,empty,empty,qframe,tframe,qaln,taln,qlen,tlen" \
-v 2

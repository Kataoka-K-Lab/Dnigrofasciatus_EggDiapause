conda activate gemoma

genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.fa.masked
outdir=/work3/kataoka/madarasuzu/gemoma

cd /work3/kataoka/madarasuzu/gemoma

GeMoMa CheckIntrons t=$genome i=$outdir/introns.gff outdir=$outdir > CheckIntrons.out 2>&1
GeMoMa -Xmx30g DenoiseIntrons i=$outdir/introns.gff c=UNSTRANDED coverage_unstranded=$outdir/coverage.bedgraph outdir=$outdir > DenoiseIntrons.out 2>&1

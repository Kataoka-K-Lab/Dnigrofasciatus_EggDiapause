# GeMoMa gene model

## Apis_mellifera
gemoma_amel=/work3/kataoka/madarasuzu/gemoma/GeMoMa_GAF_amel/filtered_predictions.gff

## Drosophila_melanogaster
gemoma_dmel=/work3/kataoka/madarasuzu/gemoma/GeMoMa_GAF_dmel/filtered_predictions.gff

## Tribolium_castaneum
gemoma_tcas=/work3/kataoka/madarasuzu/gemoma/GeMoMa_GAF_tcas/filtered_predictions.gff

# GeMoMa outputs
denoised_introns=/work3/kataoka/madarasuzu/gemoma/denoised_introns.gff
coverage_bedgraph=/work3/kataoka/madarasuzu/gemoma/coverage.bedgraph

# Braker3 gene model (e.g., Stringtie2, Scallop)
ref_gff=/work3/kataoka/madarasuzu/braker3/braker.gtf

# Reference genome
genome=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.sm.fa

# StringTie2
stringtie=/work3/kataoka/madarasuzu/stringtie2/merge/stringtie_merged.gtf.fasta.transdecoder.genome.gff3

# Working dir
work_dir=/work3/kataoka/madarasuzu/gffcompare/braker3_strigntie_2


############

cd $work_dir

gffcompare $gemoma_amel $gemoma_dmel $gemoma_tcas \
-r $ref_gff -o gffcmp

gffcompare $stringtie \
-r $ref_gff -o gffcmp_st

## Apis_mellifera
cat gffcmp.tracking | awk '$4=="u" || $4=="i" || $4=="y" {print $5}' | awk -F ":" '{print $2}' |  awk -F "|" '{print $2}' | sed '/^$/d' > amel_keep
cat $gemoma_amel | grep -wf amel_keep > gemoma_amel_keep.gff

## Drosophila_melanogaster
cat gffcmp.tracking | awk '$4=="u" || $4=="i" || $4=="y" {print $6}' | awk -F ":" '{print $2}' |  awk -F "|" '{print $2}' | sed '/^$/d' > dmel_keep
cat $gemoma_dmel | grep -wf dmel_keep > gemoma_dmel_keep.gff

## Tribolium_castaneum
cat gffcmp.tracking | awk '$4=="u" || $4=="i" || $4=="y" {print $7}' | awk -F "transcript:" '{print $2}' |  awk -F "|" '{print $1}' | sed '/^$/d' > tcas_keep
cat $gemoma_tcas | grep -wf tcas_keep > gemoma_tcas_keep.gff

## Stringtie2
cat gffcmp_st.tracking | awk '$4=="u" || $4=="i" || $4=="y" {print $5}' | awk -F ":" '{print $2}' |  awk -F "|" '{print $2}' > st_keep

cat $stringtie | grep -wf st_keep > st_keep_2.gff

# cat st_keep_2.gff | awk '$3 != "exon" || $3 != "five_prime_UTR" || $3 != "three_prime_UTR" {print $0}' > st_keep_2_woExon.gff
cat st_keep_2.gff | awk '$3 != "exon" {print $0}' > st_keep_2.tmp.gff
cat st_keep_2.tmp.gff | awk '$3 != "five_prime_UTR" {print $0}' > st_keep_2.tmp.tmp.gff
cat st_keep_2.tmp.tmp.gff | awk '$3 != "three_prime_UTR" {print $0}' > st_keep_2_woExon.gff

source ~/.bashrc
conda activate gemoma

## Apis_mellifera
mkdir amel_AnnotationEvidence && cd amel_AnnotationEvidence
GeMoMa AnnotationEvidence a=$work_dir/gemoma_amel_keep.gff g=$genome outdir=$work_dir/amel_AnnotationEvidence
cd ..

## Drosophila_melanogaster
mkdir dmel_AnnotationEvidence && cd dmel_AnnotationEvidence
GeMoMa AnnotationEvidence a=$work_dir/gemoma_dmel_keep.gff g=$genome outdir=$work_dir/dmel_AnnotationEvidence
cd ..

## Tribolium_castaneum
mkdir tcas_AnnotationEvidence && cd tcas_AnnotationEvidence
GeMoMa AnnotationEvidence a=$work_dir/gemoma_tcas_keep.gff g=$genome outdir=$work_dir/tcas_AnnotationEvidence
cd ..

## Stringtie2
mkdir st_AnnotationEvidence && cd st_AnnotationEvidence
GeMoMa AnnotationEvidence a=$work_dir/st_keep_2_woExon.gff g=$genome outdir=$work_dir/st_AnnotationEvidence
cd ..

# GeMoMa Annotation Filter

mkdir ref_gff && cd ref_gff
GeMoMa AnnotationEvidence a=$ref_gff g=$genome outdir=$work_dir/ref_gff

cd ..

GeMoMa -Xmx10G GAF \
g=$work_dir/ref_gff/annotation_with_attributes.gff \
g=$work_dir/amel_AnnotationEvidence/annotation_with_attributes.gff \
g=$work_dir/dmel_AnnotationEvidence/annotation_with_attributes.gff \
g=$work_dir/tcas_AnnotationEvidence/annotation_with_attributes.gff \
g=$work_dir/st_AnnotationEvidence/annotation_with_attributes.gff \
tf=true \
outdir=$work_dir

# Annotation Finalizer

GeMoMa -Xmx10G AnnotationFinalizer \
g=$genome \
a=$work_dir/filtered_predictions.gff \
u=NO \
tf=true \
rename=COMPOSED \
p=Dnig \
infix=G \
d=6 \
outdir=$work_dir

#genes: 20812
#warnings: [0, 0]
#mRNAs: 21070
#warnings: [0, 0]
#CDSs: 114355
#warnings: [0, 0]

source ~/.bashrc
conda activate

# gffread

# GFF3 to GTF
gff3_in=final_annotation.gff
gtf_out=final_annotation.gtf
gffread $gff3_in -g $genome -E -T -o $gtf_out

# .. loaded 21070 genomic features from final_annotation.gff

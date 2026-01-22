ALIGN_IN=/work2/kataoka/madarasuzu/repeatmasker/masurca405_ph_hirise.fa.align
FASTA_IN=/work2/kataoka/madarasuzu/hirise/masurca405_ph_hirise.fa
SPECIES_NAME=Dianemobius_nigrofasciatus

## Repeat Landscape ##

### STEP 1 ###

/home/kataoka/work/RepeatMasker/util/calcDivergenceFromAlign.pl \
-s ${SPECIES_NAME}.divsum \
${ALIGN_IN}

### STEP 2 ###

faToTwoBit ${FASTA_IN} ${SPECIES_NAME}.2bit

### STEP 3 ###

/home/kataoka/work/RepeatMasker/util/createRepeatLandscape.pl \
-div ${SPECIES_NAME}.divsum \
-twoBit ${SPECIES_NAME}.2bit > ${SPECIES_NAME}.html

/home/kataoka/work/RepeatMasker/util/createRepeatLandscape.pl \
-div Dianemobius_nigrofasciatus.divsum \
-twoBit Dianemobius_nigrofasciatus.2bit > Dianemobius_nigrofasciatus.html

## HTML File Analysis ##

git clone https://github.com/kataksk/repeatlandscape_parser.git

### STEP 4 ###

python repeatlandscape_parser/repeatlandscape_html_to_csv.py \
-s ${SPECIES_NAME} \
-l ${SPECIES_NAME}.html --ggplot

### STEP 5 ###

python repeatlandscape_parser/repeatlandscape_html_pie_to_csv.py \
-s ${SPECIES_NAME} \
-l ${SPECIES_NAME}.html

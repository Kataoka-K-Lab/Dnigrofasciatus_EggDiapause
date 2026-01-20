#!/bin/bash -f

#PBS -S /bin/bash
#PBS -l nodes=1:ppn=20:yuri
#PBS -q yuri
#PBS -N repeatmodeler
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

WORK_DIR=/work2/kataoka/madarasuzu/repeatmodeler2_raw
INPUT_GENOME=/work2/kataoka/madarasuzu/hirise/masurca405_ph_hirise.fa
DB_NAME=dnig
THREADS=20

cd $WORK_DIR

/home/kataoka/work/RepeatModeler-2.0.1/BuildDatabase \
-name $DB_NAME \
-engine rmblast \
$INPUT_GENOME

/home/kataoka/work/RepeatModeler-2.0.1/RepeatModeler \
-engine rmblast \
-pa $THREADS \
-database $DB_NAME

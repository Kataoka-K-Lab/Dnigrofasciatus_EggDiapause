#!/bin/bash -f
#PBS -l nodes=1:ppn=80:cosmos
#PBS -q cosmos
#PBS -N masurca410
#PBS -j eo
#PBS -m ae
#PBS -M kataokak@aoni.waseda.jp

cd /work2/kataoka/madarasuzu/masurca410_cosmos
export LD_LIBRARY_PATH=/home/kataoka/miniconda3/envs/masurca/lib:$LD_LIBRARY_PATH
/work2/kataoka/MaSuRCA-4.1.0/bin/masurca config.txt -o assemble.sh --skip-checking
./assemble.sh

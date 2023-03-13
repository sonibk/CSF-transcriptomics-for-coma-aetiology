#!/bin/bash

#SBATCH -p debug
#SBATCH -N 1 # number of nodes
#SBATCH -n 5 # number of cores
#SBATCH --mem 100 # memory pool for all cores
#SBATCH -t 0-2:00 # time (D-HH:MM)
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERR

module load fastp

for sample in `cat sample_names.txt`

do

fastp -q 20 -l 25 -3 -M 20 -i ${sample}_R1_001.fastq.gz 
-o ./results/${sample}_R1_fastp_fastq.gz -I ${sample}_R2_001.fastq.gz 
-O ./results/${sample}_R2_fastp_fastq.gz 
-h ./results/${sample}.fastp.html  
-j ./results/${sample}.fastp.json

done 

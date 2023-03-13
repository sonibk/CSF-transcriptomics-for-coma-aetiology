#!/usr/bin/bash

#SBATCH -J kallisto quantfication of coma CSF samples
#SBATCH -p longrun
#SBATCH -n 5
#SBATCH --mem-per-cpu 8000
#SBATCH -o job.%j.out
#SBATCH -e job.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=BKarumbo@kemri-wellcome.org

#load stringtie from server
module load kallisto/0.42.4

#bash script for kallisto; align all .fastq.gz files to indexed reference genome to generate kalisto files


for SAMPLE in `ls -1 *_R1_001.fastq.gz | sed 's/_R1_001.fastq.gz//' `
do
    kallisto quant -i hsGRCh38_kallisto -o kallisto_out/${SAMPLE} -b 100 ${SAMPLE}_R1_001.fastq.gz ${SAMPLE}_R2_001.fastq.gz
done

#this works

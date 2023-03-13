#!/bin/bash
for sample in `cat sample_id.txt` ## opens the file with file names
do
	fastqc ${sample}_R1.fastq.gz ${sample}_R2.fastq.gz --outdir QC_Reports  ### does quality check on all fastq files and stores results in QC_reports
done

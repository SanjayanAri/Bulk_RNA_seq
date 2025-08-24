#!/bin/bash

# aligned reads folder
cd /home/sanjayan/Documents/RNA_sequencing/workshop_samples/align 

# Loop over all BAM files
for bam in *.bam; do
    start=$(date +%s)  # start time

    echo "Processing $bam ..."
    featureCounts -s 0 -T 3 -a /home/sanjayan/Documents/RNA_sequencing/workshop_samples/Homo_sapiens.GRCh38.114.gtf \
        -o /home/sanjayan/Documents/RNA_sequencing/workshop_samples/quants${bam%.bam}_featurecounts.txt \
        "$bam"

    end=$(date +%s)  # end time
    runtime=$(( (end - start) / 60 ))  # in minutes

    echo "✅ Completed $bam in $runtime minutes."
    echo "------------------------------------"
done

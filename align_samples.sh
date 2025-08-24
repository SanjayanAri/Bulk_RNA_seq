#!/bin/bash

echo "Starting alignment of RNA-seq samples"
echo
echo "Using HISAT2 for alignment and SAMtools for conversion to BAM format"
echo
echo "Ensure that HISAT2 and SAMtools are installed and available in your PATH or in your conda environment"
# Define directories (absolute paths as requested)
fastq_dir="/home/sanjayan/Documents/RNA_sequencing/workshop_samples/Samples"
output_dir="/home/sanjayan/Documents/RNA_sequencing/workshop_samples/align"
index_base="/home/sanjayan/Documents/RNA_sequencing/grch38_genome/grch38/genome"

# Create output directory if missing
mkdir -p "$output_dir"

# Process each FASTQ file
for fastq in "$fastq_dir"/*.fastq.gz; do
    # Extract base filename without extension
    sample_name=$(basename "$fastq" .fastq.gz)
    
    # Define output BAM path
    bam_file="$output_dir/${sample_name}.bam"
    
    echo "Processing $sample_name..."
    
    # HISAT2 alignment with SAM-to-BAM conversion and sorting
    hisat2 -p 3 -x "$index_base" -U "$fastq" | \
    samtools sort -@ 3 -o "$bam_file" -
    
    # Index BAM file
    samtools index "$bam_file"
done

echo "Alignment and indexing completed."

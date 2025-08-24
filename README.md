# Bulk_RNA_seq
## Introduction
#### ONECUT2 is a driver of neuroendocrine prostate cancer

Link: https://pmc.ncbi.nlm.nih.gov/articles/PMC6336817/#Sec11

#### Summary
To determine the underlying mechanism of ONECUT2 in prostate cancer hypoxia, we conducted a series of RNA-Seq and ChIP-Seq experiments in LNCaP and PC3 cells under normoxia and hypoxia conditions. We did RNA-Seq in LNCaP cells with or without OC2 overexpression and in PC3 cells with or without OC2 knockdown. We used anti-Flag antibody to perform the ChIP-Seq experiment in PC3 cells with Flag and OC2 fusion protein overexpression. We also performed HIF1A ChIP-Seq in AR-negative prostate cancer cell line PC3 under hypoxia condition with or without ONECUT2 or SMAD3 siRNA knockdown. SMAD3 and HIF2A ChIP-Seq were conducted in PC3 cells under hypoxia condition. To confirm the interactions between transcription factors, we also performed ChIP-reChIP-seq. We did the primary ChIP experiment using anti-SMAD3 antibody and then we subjected the ChIPed chromatin by the primary ChIP to reChIP experiments using anti-HIF1A or anti-HIF2A antibody. The reChIPed DNA was submitted to next generation sequencing.

#### Data acquision: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE106305

Citation(s) 	

    Guo H, Ci X, Ahmed M, Hua JT et al. ONECUT2 is a driver of neuroendocrine prostate cancer. Nat Commun 2019 Jan 17;10(1):278. PMID: 30655535

## Workflow
#### Data acquition
Using the SRA toolkit I have acquired the data from the fastqdump tool, a script was made to prefetch the Single-end RNA sequence data using the SRA IDs. A total of 20 samples were downloaded and the data was converted from .SRA to .Fastq. The 20 downloaded fastq files which contains replicates were concatonated together to 8 fastq files and are grouped on basis of hypoxia and normoxia conditions of the two cell lines LNCAP and PC3.

#### QC 
The fastq files were checked for QC using FASTQC and the results were generated. The generated results were then given to MultiQC tool for a combined QC analysis, the reads were looking good in the overall analysis and hence it is good to go for further processing.

#### Concatenating the files
20 fastq files had replicates of LNCAP cell line and PC3 cell line data with normoxia and hypoxia condition. These 20 files were concatenated to 8 files in the end.

#### Alignment
Alignment was done using HISAT2, The index for the alignement was downloaded from HISAT2 AWS database. The vesrion used was grch38., alignment was done to genome. Post alignment the data was directly converted to .bam file and indexed using SAMTOOLS.

#### Count matrix
The indexed BAM files were checked for the quality using qualimap and the aligned reads were assigned to genomic features and annotated by featureCounts (Subreads). The count matrix is produced for the 8 samples and then they were merged as one count matrix for the diffrential gene expression analysis.

#### DGE Analysis
The differential gene expression analysis was done in R with DESeq2 package. The analysis was done on google collab the Notebook is attached here in this repository. 
reference for the analysis: https://erilu.github.io/bulk-rnaseq-analysis/#Obtaining_raw_data_from_GEO

I have attached the scripts and some of the results in this repository. I will also attach my conda enviroment .yml file for version control. The analysis was done using 2 conda environments 1 for qc and 1 for the RNA seq analysis.

To create and use the environment with my .yml files use this following base command:

conda env create -f environment.yml


##### EXTRA INFO:
This analysis was done in Anaconda3 with 8Gb ram and i5 7200u processor (@ 3.10 GHz) in ubuntu 25.04 plucky OS 
It took ~2.5 hr to get the fastq file and 8 hours to do the alignment. Qualimap sometimes fails as more RAM is needed. 


This was done in workshop for RNA seq conducted by Smriti Arora, I am thank full for her mentorship and this workshop.  

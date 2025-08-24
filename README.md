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
Using the SRA toolkit I have acquired the data from the fastqdump tool, a script was made to prefetch the Single-end RNA sequence data using the SRA IDs. A total of 20 samples were downloaded and the data was converted from .SRA to .Fastq

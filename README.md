# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC.

## Installation of samtools
sudo apt-get install samtools

## CellRanger Installation
## Download cell ranger using wget
  - at https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest#cr-wget

## Download reference refdata
  - curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
  - curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz

## Prepare a single directory for cellranger and database
  - mv ./refdata-gex-mm10-2020-A.tar.gz /home/cellranger/database/
  - mv ./refdata-gex-GRCh38-2020-A.tar.gz /home/cellranger/database/
  - mv ./cellranger-7.1.0.tar.gz /home/cellranger/
  - cd /home/cellranger/
  - mkdir /home/cellranger/ #### Grant
  - mkdir /home/cellranger/database/
  - sudo chmod a+x -R /home/cellranger/

## Create fasta indexes
  - sudo samtools faidx /home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa
  - sudo samtools faidx /home/cellranger/database/refdata-gex-mm10-2020-A/fasta/genome.fa

## Untar cell ranger
  - cd /home/cellranger/
  - tar -xzvf cellranger-7.1.0.tar.gz

## Verify installation
  - /home/cellranger/cellranger-7.1.0/bin/cellranger testrun --id 10

## Confgure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

## Create reference files for homo sapiens
cellranger mkref \
  --nthreads=4 \
  --genome=/home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/ \
  --fasta=/home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
  --genes={ANNOTATION GTF}

# Integrative analysis
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

## Create fasta indexes
  - sudo samtools faidx /home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa
  - sudo samtools faidx /home/cellranger/database/refdata-gex-mm10-2020-A/fasta/genome.fa

## Untar cell ranger
  - cd /home/cellranger/
  - tar -xzvf cellranger-7.1.0.tar.gz

## Verify installation
  - /home/cellranger/cellranger-7.1.0/bin/cellranger testrun --id 10

## Confgure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

## Create reference files for homo sapiens
cellranger mkref \
  --nthreads=4 \
  --genome={OUTPUT FOLDER FOR INDEX} \
  --fasta=/home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
  --genes={ANNOTATION GTF}

# Integrative analysis

https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

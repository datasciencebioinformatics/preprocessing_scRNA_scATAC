# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC. This step focuses on the installation, preparation and execution of Cellranger.

## Installation of samtools and python packages
  - sudo apt install python3-docopt
  - sudo apt install python3-lz4
  - sudo apt install python3-numpy
  - sudo apt-get install samtools

## CellRanger Installation
## Download cell ranger using wget
  - at https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest#cr-wget

## Download reference refdata
  - curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
  - curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz

## Download reference gene data
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M32/gencode.vM32.annotation.gtf.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/gencode.v43.annotation.gtf.gz
    
## Prepare a single directory for cellranger and database
### Create dir
  - mkdir /home/cellranger/                                           #### create cellranger folder
  - mkdir /home/cellranger/database/                                  #### create cellranger database

### Go to cellranger folder
  - cd /home/cellranger/                                              #### go to cellranger folder
  - chmod a+x -R /home/cellranger/                                    #### grant sudo permissiom folder- 
    
### Move files to correspondent directories
  - mv ./gencode.vM32.annotation.gtf.gz /home/cellranger/database/    #### Move mouse annotation to database folder
  - mv ./gencode.v43.annotation.gff3.gz /home/cellranger/database/    #### Move human annotation to database folder
  - mv ./refdata-gex-mm10-2020-A.tar.gz /home/cellranger/database/    #### Move mouse genome to database folder
  - mv ./refdata-gex-GRCh38-2020-A.tar.gz /home/cellranger/database/  #### Move human genome to database folder
  - mv ./cellranger-7.1.0.tar.gz /home/cellranger/                    #### Move cellranger file to folder

## Untar cell cellranger and annotation tar.gz # Check .gtf.gz
  - cd /home/cellranger/database/                                     #### go to cellranger folder- 
  - tar -xzvf cellranger-7.1.0.tar.gz
  - gzip -d gencode.v43.annotation.gtf.gz
  - gzip -d gencode.vM32.annotation.gtf.gz
  - tar -xzvf  /home/cellranger/database/refdata-gex-mm10-2020-A.tar.gz
  - tar -xzvf  /home/cellranger/database/refdata-gex-GRCh38-2020-A.tar.gz
 
## Create fasta indexes
  - samtools faidx /home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa
  - samtools faidx /home/cellranger/database/refdata-gex-mm10-2020-A/fasta/genome.fa

## Verify installation
  - /home/cellranger/cellranger-7.1.0/bin/cellranger testrun --id 10

## Configure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

## Prepare gff3 files
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.v43.annotation.gtf /home/cellranger/database/gencode.v43.annotation.transcripts.gtf --attribute=key:allowable_value
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.vM32.annotation.gtf /home/cellranger/database/gencode.vM32.annotation.transcripts.gtf --attribute=key:allowable_value

## Create reference files
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=human --fasta=/home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa --genes=/home/cellranger/database/gencode.v43.annotation.transcripts.gtf # Human
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=mouse --fasta=/home/cellranger/database/refdata-gex-mm10-2020-A/fasta/genome.fa --genes=/home/cellranger/database/gencode.vM32.annotation.transcripts.gtf # Mouse

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

# Integrative analysis
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html


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

## Download reference gene data and corresponding genome
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M32/gencode.vM32.annotation.gtf.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/gencode.v43.annotation.gtf.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/GRCh38.p13.genome.fa.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M32/GRCm39.genome.fa.gz    
    
## Prepare a single directory for cellranger and database
### Create dir
  - mkdir /home/cellranger/                                           #### create cellranger folder
  - mkdir /home/cellranger/database/                                  #### create cellranger database

### Go to cellranger folder
  - cd /home/cellranger/                                              #### go to cellranger folder
  - chmod a+x -R /home/cellranger/                                    #### grant sudo permissiom folder- 
    
### Move files to correspondent directories
  - mv ./gencode.vM32.annotation.gtf.gz /home/cellranger/database/            #### Move mouse annotation to database folder
  - mv ./gencode.v43.annotation.gff3.gz /home/cellranger/database/            #### Move human annotation to database folder 
  - mv ./GRCh38.p13.genome.fa.gz /home/cellranger/database/                   #### Move mouse genome to database folder
  - mv ./GRCm39.genome.fa.gz     /home/cellranger/database/                   #### Move human genome to database folder
  - mv ./cellranger-7.1.0.tar.gz /home/cellranger/                            #### Move cellranger file to folder

## Untar cell cellranger and annotation tar.gz # Check .gtf.gz
  - cd /home/cellranger/database/                                         #### go to database folder- 
  - tar -xzvf cellranger-7.1.0.tar.gz                                     #### unzip cellranger
  - gzip -d gencode.v43.annotation.gtf.gz                                 #### unzip gencode.v43.annotation.gtf
  - gzip -d gencode.vM32.annotation.gtf.gz                                #### unzip gencode.vM32.annotation.gtf
  - gzip -d GRCm39.genome.fa.gz                                           #### unzip gencode.v43.annotation.gtf
  - gzip -d GRCh38.p13.genome.fa.gz                                       #### unzip gencode.vM32.annotation.gtf- 
  
 
## Create fasta indexes
  - sudo samtools faidx /home/cellranger/database/GRCm39.genome.fa
  - sudo samtools faidx /home/cellranger/database/GRCh38.p13.genome.fa

## Verify installation
  - /home/cellranger/cellranger-7.1.0/bin/cellranger testrun --id 10

## Configure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

## Prepare gff3 files
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.v43.annotation.gtf /home/cellranger/database/gencode.v43.annotation.transcripts.gtf --attribute=key:allowable_value
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.vM32.annotation.gtf /home/cellranger/database/gencode.vM32.annotation.transcripts.gtf --attribute=key:allowable_value

## Create fasta indexes
  - sudo samtools faidx /home/cellranger/database/refdata-gex-GRCh38-2020-A/fasta/genome.fa
  - sudo samtools faidx /home/cellranger/database/refdata-gex-mm10-2020-A/fasta/genome.fa

## Create reference files
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=human --fasta=/home/cellranger/database/GRCm39.genome.fa --genes=/home/cellranger/database/gencode.v43.annotation.transcripts.gtf # Human
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=mouse --fasta=/home/cellranger/database/GRCh38.p13.genome.fa --genes=/home/cellranger/database/gencode.vM32.annotation.transcripts.gtf # Mouse

# Integrative analysis
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

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

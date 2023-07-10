##############################################################################################
# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC. This step focuses on the installation, preparation and execution of Cellranger.

## Step 1 - Installation of samtools and python packages
  - sudo apt install python3-docopt
  - sudo apt install python3-lz4
  - sudo apt install python3-numpy
  - sudo apt-get install samtools
  - sudo apt-get install biobambam2
  
## Step 2 -  CellRanger Installation
### Download CellRanger follozing instructions from :
  - https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest#cr-wget

### Download reference gene data and corresponding genome
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M32/gencode.vM32.chr_patch_hapl_scaff.annotation.gtf.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/gencode.v43.annotation.gtf.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_43/GRCh38.p13.genome.fa.gz
  - wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M32/GRCm39.genome.fa.gz    
    
### Step 3 - Prepare database and tool directory
#### Create dir
  - mkdir /home/cellranger/                                           #### create cellranger folder
  - mkdir /home/cellranger/database/                                  #### create cellranger database

#### Go to cellranger folder
  - cd /home/cellranger/                                              #### go to cellranger folder
  - chmod a+x -R /home/cellranger/                                    #### grant sudo permissiom folder- 
    
#### Move files to correspondent directories
  - mv ./gencode.vM32.chr_patch_hapl_scaff.annotation.gtf.gz /home/cellranger/database/            #### Move mouse annotation to database folder
  - mv ./gencode.v43.annotation.gff3.gz /home/cellranger/database/                                 #### Move human annotation to database folder 
  - mv ./GRCh38.p13.genome.fa.gz /home/cellranger/database/                                        #### Move mouse genome to database folder
  - mv ./GRCm39.genome.fa.gz     /home/cellranger/database/                                        #### Move human genome to database folder
  - mv ./cellranger-7.1.0.tar.gz /home/cellranger/                                                 #### Move cellranger file to folder

### Step 4 - Install CellRanger :
#### Untar cell cellranger
  - cd /home/cellranger/database/                                         #### go to database folder- 
  - tar -xzvf cellranger-7.1.0.tar.gz                                     #### unzip cellranger

#### Untar annotation tar.gz
  - gzip -d gencode.v43.annotation.gtf.gz                                 #### unzip gencode.v43.annotation.gtf
  - gzip -d gencode.vM32.chr_patch_hapl_scaff.annotation.gtf.gz           #### unzip gencode.vM32.annotation.gtf
  - gzip -d GRCm39.genome.fa.gz                                           #### unzip GRCm39.genome.fa.gz
  - gzip -d GRCh38.p13.genome.fa.gz                                       #### unzip GRCh38.p13.genome.fa

### Step 5 - Prepare CellRanger database :   
#### Create fasta indexes
  - sudo samtools faidx /home/cellranger/database/GRCm39.genome.fa     # Human genome index
  - sudo samtools faidx /home/cellranger/database/GRCh38.p13.genome.fa # Mouse genome index

#### Configure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

#### Filter gft files
  - sudo gffread /home/cellranger/database/gencode.v43.annotation.gtf -o /home/cellranger/database/gencode.v43.annotation.filtered.gtf
  - sudo gffread /home/cellranger/database/gencode.vM32.chr_patch_hapl_scaff.annotation.gtf -o /home/cellranger/database/gencode.vM32.chr_patch_hapl_scaff.annotation.filtered.gtf

#### Prepare gft files
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.v43.annotation.gtf /home/cellranger/database/gencode.v43.annotation.transcripts.gtf --attribute=key:allowable_value # Human gtf file
  - /home/cellranger/cellranger-7.1.0/bin/cellranger mkgtf /home/cellranger/database/gencode.vM32.annotation.gtf /home/cellranger/database/gencode.vM32.annotation.transcripts.gtf --attribute=key:allowable_value # Mouse gtf file

## Create reference files
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=human --fasta=/home/cellranger/database/GRCm39.genome.fa --genes=/home/cellranger/database/gencode.v43.annotation.transcripts.gtf # Human annotation formatted
  - sudo /home/cellranger/cellranger-7.1.0/bin/cellranger mkref --nthreads=4 --genome=mouse --fasta=/home/cellranger/database/GRCh38.p13.genome.fa --genes=/home/cellranger/database/gencode.vM32.chr_patch_hapl_scaff.annotation.gtf # Mouse annotation formatted

## Untar cell ranger
  - cd /home/cellranger/
  - tar -xzvf cellranger-7.1.0.tar.gz

## Configure cellranger
  - /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
  - /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt
    
## Call cellranger for single-cell rna-seq
  -
## Call cellranger for single-cell ATAC
  -
### Cellranger sc-ATAC input:
  - reference-genome
  - fastq-folder
  - metadata (project-id, reference-genome, fastq-folder, sample-name)

### Cellranger sc-ATAC output:
  - Read filtering and alignment
  - Barcode counting
  - Identification of transposase cut sites
  - Detection of accessible chromatin peaks
  - Cell calling
  - Count matrix generation for peaks and transcription factors
  - Dimensionality reduction
  - Cell clustering
  - Cluster differential accessibility

#######################################################################################################################
### Create a metadata file to list the files and info for each sample 
metadata_file=/home/cellranger/database/metadata.txt

### Cellranger sc-ATAC command:
#### For each sample in the metadata, cellranger-atac count will be used 
#### fastqs=
#### reference=
cat /home/cellranger/database/metadata.txt | grep -v #  | while read line 
do
    # Take the id
        
    # sample=       
done






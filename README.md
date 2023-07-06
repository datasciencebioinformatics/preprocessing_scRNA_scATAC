<!-- GETTING STARTED -->

# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC.

## CellRanger Installation

### Download cell ranger using wget
- at https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest#cr-wget

### Download reference refdata
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz

### Prepare a single directory for cellranger and database
- mkdir /home/cellranger/                           #### Create folder cellranger
- mkdir /home/cellranger/database/                  #### Create folder database
- sudo chmod a+x -R /home/cellranger/               #### Grant sudo permission to folder
- mv ./refdata-gex-GRCh38-2020-A.tar.gz /home/cellranger/database/  #### Move refdata to database    
- mv ./refdata-gex-mm10-2020-A.tar.gz /home/cellranger/database/    #### Move refdata to database
- mv ./cellranger-7.1.0.tar.gz /home/cellranger/                    #### Move .tar.gz to base folder                          

### Untar cell ranger 
- cd /home/cellranger/
- tar -xzvf cellranger-7.1.0.tar.gz

### Confgure cellranger
- /home/cellranger/cellranger-7.1.0/bin/cellranger sitecheck
- /home/cellranger/cellranger-7.1.0/bin/cellranger upload felipe.flv@gmail.com sitecheck.txt

### Verify installation
- /home/cellranger/cellranger-7.1.0/bin/cellranger testrun --id=tiny
- 
### Integrative analysis using R Maestro 
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

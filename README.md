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
- mkdir /home/cellranger/
- mkdir /home/cellranger/database/
- mv ./refdata-gex-GRCh38-2020-A.tar.gz /home/cellranger/database/
- mv ./refdata-gex-mm10-2020-A.tar.gz /home/cellranger/database/
- mv ./cellranger-7.1.0.tar.gz /home/cellranger/

### Untar cell ranger 
- tar -xzvf cellranger-7.1.0.tar.gz

### Prepend the Cell Ranger directory to your $PATH
- export PATH=$PATH:/home/cellranger/cellranger-7.1.0/
  
### Verify installation
- cellranger testrun --id 10
  

### Integrative analysis using R Maestro 
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

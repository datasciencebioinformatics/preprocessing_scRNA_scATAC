<!-- GETTING STARTED -->

# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC.#

## Installation
- CellRanger installation
  
### Download cell ranger using wget
See https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest#cr-wget

### Untar cell ranger 
tar -xzvf cellranger-7.1.0.tar.gz

### Download reference refdata
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz

### Prepare a single directory for cellranger and database
- mkdir /home/cellranger/
- mkdir /home/cellranger/database/

### Prepend the Cell Ranger directory to your $PATH


### Verify installation
cellranger-7.1.0/bin/cellranger testrun --id 10
















# Integrative analysis using R Maestro 
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

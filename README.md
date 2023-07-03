<!-- GETTING STARTED -->

# preprocessing_scRNA_scATAC
Workflow for pre-processing sequencing files for Integrative sc-RNA and sc-ATAC.

## Installation
- CellRanger installation
  
### Download and unpack cell Ranger
wget -O cellranger-7.1.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.1.0.tar.gz?Expires=1688449085&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci03LjEuMC50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODg0NDkwODV9fX1dfQ__&Signature=fU0rpFrOlr3y5z9-bPZO6xE~wziBL6XeHOsXZn0TYM1hKTviP8ERn-tLMkP4TMpykr91lAsbdzB8XEx~9eZzPPjrdczlcI-eWfxdqN3BXFtj-Y88QV9GH1XKc7nhSf5CvQb1yGUg49poVXmmPa0qr7IzY96bcQ7gm4dJ8QuwOeraxq43VMwIKSu-L8aWl2exYsyYSL-v-8EydVIhhoJ7Gxmrida5V05KJteFVS9NyUczBRqgoyt8OMIfej2IEXZJckiSeKNgOOlUMb65BlpFhZcOcNvsDnn7ocgvCUSP5vY~1cZvXwnL0UK4NqK1X20Fh0sIhSj65PVUh8qzjfb-Bw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

tar -xzvf cellranger-7.1.0.tar.gz

### Download Cell Ranger
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
- curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz 

### Verify installation
cellranger-7.1.0/bin/cellranger testrun --id 10
















# Integrative analysis using R Maestro 
https://liulab-dfci.github.io/MAESTRO/example/Integration/Integration.html

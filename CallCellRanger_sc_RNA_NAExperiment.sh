### Cellranger sc-ATAC command:
#### For each sample in the metadata, cellranger-atac count will be used 
#### fastqs=
#### reference=
cat /home/cellranger/database/metadata.txt | grep -v "#"  | while read line 
do
  # Take the id
  experiment=$(echo $line | awk {'print $1'})
  
  # Take the id
  file=$(echo $line | awk -v directory=$database_folder {'print directory$2'})
  
  # Take the sample
  sample=$(echo $line | awk {'print $3'})
	
  # Take the lane
  lane=$(echo $line | awk {'print $4'})	
	
  # Take the sample
  rep=$(echo $line | awk {'print $5'})		
	
  # Take the sample
  direction=$(echo $line | awk {'print $6'})

  # Take the transcriptome
  transcriptome==$(echo $line | awk {'print $7'})
	
  # Print
  echo -e $experiment" "$file"\t"$sample"\t"$lane"\t"$rep"\t"$direction	
  
done
  # Print the command line
  echo /home/cellranger/cellranger-6.1.2/bin/cellranger /home/cellranger/cellranger-6.1.2/count --id=$experiment --transcriptome=$transcriptome --fastqs=/home/cellranger/database/hypothalamu_scRNA_scATAC/ --sample=$sample --localcores=8 --localmem=16

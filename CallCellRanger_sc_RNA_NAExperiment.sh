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
	
  # Print
  echo -e $experiment" "$file"\t"$sample"\t"$lane"\t"$rep"\t"$direction	
done

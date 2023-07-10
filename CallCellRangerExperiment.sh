### Cellranger sc-ATAC command:
#### For each sample in the metadata, cellranger-atac count will be used 
#### fastqs=
#### reference=
cat /home/cellranger/database/metadata.txt | grep -v "#"  | while read line 
do
  # Take the id
  file=$(echo $line | awk -v directory=$database_folder {'print directory$1'})
  
  # Take the sample
  sample=$(echo $line | awk {'print $2'})
	
  # Take the lane
  lane=$(echo $line | awk {'print $3'})	
	
  # Take the sample
  rep=$(echo $line | awk {'print $4'})		
	
  # Take the sample
  direction=$(echo $line | awk {'print $5'})			
	
  # Print
  echo -e $file" "$sample"\t"$lane"\t"$rep"\t"$direction	
done

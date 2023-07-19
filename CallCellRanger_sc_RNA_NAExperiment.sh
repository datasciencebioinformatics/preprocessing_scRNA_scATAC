# Save file for command
command_file="/home/cellranger/database/command_file.txt"

# Clean file for command
rm -r $command_file

### Cellranger sc-ATAC command:
#### For each sample in the metadata, cellranger-atac count will be used 
cat /home/cellranger/database/metadata.txt | grep -v "#"  | awk {'print $6'} | sort -u | uniq | while read unique_samples
do
	experiment=""
 	file=""
  	sample=""
   	lane=""
    	rep=""
     	direction=""
      	transcriptome=""
	cat /home/cellranger/database/metadata.txt | grep $unique_samples | awk '{print $1"\t"$3"\t"$7}' | sort -u | while read line
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
   
  	done		  
	# Print the command line
	echo /home/cellranger/cellranger-6.1.2/bin/cellranger /home/cellranger/cellranger-6.1.2/count --id=$experiment --transcriptome=$transcriptome --fastqs=/home/cellranger/database/hypothalamu_scRNA_scATAC/ --sample=$sample --localcores=8 --localmem=16

   done

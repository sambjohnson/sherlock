#!/bin/bash

DIR=/scratch/groups/jyeatman/HBN-sync/BIDS_curated/

COUNT=0
UNCOUNT=0
FILE=''
for sub in $(ls $DIR);
do
	# select first element from possibly multiple *T1w files
	echo $(sub)
	filepattern="$DIR$sub/*/anat/*T1w.nii.gz"
	files=( $filepattern )
	FILE=${files[0]}
	
	if test -e $FILE; then
		echo file exists;
		echo $FILE;
		COUNT=$((COUNT+1));
	else
		UNCOUNT=$((UNCOUNT+1));
	fi
	if [ $(FILE)='' ]; then
		echo no files found for subject: $sub;
	fi
done
echo "count: $COUNT"
echo "uncount: $UNCOUNT"    

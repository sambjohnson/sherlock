#!/bin/bash

DIR=/scratch/groups/jyeatman/HBN-sync/BIDS_curated/

COUNT=0
FILE=''
for sub in $(ls $DIR);
do
	echo "$sub"
	let FILE=$DIR$sub/*/anat/*HCP_T1w.nii.gz
	if test -e $FILE; then
		echo "file exists";
		let COUNT=COUNT+1;
	else
		let FILE=$DIR$sub/*/anat/*T1w.nii.gz
		if test -e $FILE; then
			echo "file exists: not HCP";
			let COUNT=COUNT+1;
		fi
	fi
	if [ FILE='' ]; then
		echo no files found for subject: $sub;
	fi
done
echo "count: $COUNT"    

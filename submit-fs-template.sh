#!/bin/bash

#SBATCH --partition=normal,jyeatman
#SBATCH --time=8:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=4G

ml reset
ml load biology
ml load freesurfer/7.1.1

SUB=$1

export SUBJECT=$SUB
export DIR=/scratch/groups/jyeatman/HBN-sync/BIDS_curated
export SUBJECTS_DIR=$DIR/freesurfer

filepattern="$DIR/$SUBJECT/*/anat/*T1w.nii.gz"
files=( $filepattern )
FILE=${files[0]}

export FILE=$FILE
echo $SUBJECT
echo $FILE

time recon-all -s $SUBJECT -i $FILE -autorecon-all

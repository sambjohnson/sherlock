#!/bin/bash
#
#SBATCH --job-name=hbn-archive-download-attempt-4
#
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4G

ml reset
ml load system
ml load aws-cli/2.0.50

aws s3 sync s3://fcp-indi/data/Projects/HBN/MRI/ /scratch/groups/jyeatman/HBN-sync/

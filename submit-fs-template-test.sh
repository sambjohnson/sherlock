#!/bin/bash
#
#SBATCH --job-name=freesurfer
#
#SBATCH --partition=normal,jyeatman
#SBATCH --time=0:02:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=4G

ml reset
ml load biology
ml load freesurfer/7.1.1

SUB=$1
scontrol update job=$SLURM_JOB_ID name=freesurfer-$SUB

echo $SUB
echo Success!

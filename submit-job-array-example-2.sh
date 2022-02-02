#!/bin/bash
#
#SBATCH -J simple-array-example
#SBATCH --time=00:0:30
#SBATCH -n 1
#SBATCH --array 1-10
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH -p jyeatman,normal  # Queue names you can submit to
# Outputs ----------------------------------
#SBATCH -o %x-%A-%a.out
#SBATCH -e %x-%A-%a.err
#SBATCH --mail-user=samjohns@stanford.edu
#SBATCH --mail-type=END
# ------------------------------------------

SUBJECTS_FILE='substest2.txt' 

# Parse the participants.tsv file and extract one subject ID from the line corresponding to this SLURM task.
subject=$( sed "${SLURM_ARRAY_TASK_ID}q;d" ${SUBJECTS_FILE} )

# Compose the command line
# python pytest.py $subject
echo $subject
echo $SLURM_ARRAY_TASK_ID

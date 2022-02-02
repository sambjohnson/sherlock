#!/bin/bash
#
#SBATCH -J array-example
#SBATCH --time=5:00
#SBATCH -n 5
#SBATCH --array 1-10
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH -p normal  # Queue names you can submit to
# Outputs ----------------------------------
#SBATCH -o log/%x-%A-%a.out
#SBATCH -e log/%x-%A-%a.err
#SBATCH --mail-user=samjohns@stanford.edu
#SBATCH --mail-type=END
# ------------------------------------------

SUBJECTS_FILE='list_ex.txt' 
# Parse the subjects  file and extract one subject ID from the line corresponding to this SLURM task.
subject=$( sed "${SLURM_ARRAY_TASK_ID}q;d" ${SUBJECTS_FILE} )

# Compose the command line
echo $subject
echo $SLURM_ARRAY_TASK_ID
wait

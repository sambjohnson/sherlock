#!/bin/bash
#
#SBATCH -J simple-array-example # template name; you should supply an informative one
#SBATCH --time=00:0:30 # currently set to 30 seconds for testing purposes
#SBATCH -n 1
#SBATCH --array 1-10 # change upper limit (default: 10) to your number of subjects / number of jobs to make
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G
#SBATCH -p jyeatman,normal,gpu  # queue names you can submit to
# Outputs ----------------------------------
#SBATCH -o %x-%A-%a.out # where to put logs and what to call them
#SBATCH -e %x-%A-%a.err
# #SBATCH --mail-user=YOUR-EMAIL@stanford.edu # You should uncomment and replace with your own email
#SBATCH --mail-type=END
# ------------------------------------------

SUBJECTS_FILE='substest2.txt'

# Parse the participants.tsv file and extract one subject ID from the line corresponding to this SLURM task.
subject=$( sed "${SLURM_ARRAY_TASK_ID}q;d" ${SUBJECTS_FILE} )

# Compose the command line: here is where you can specify what program to run on each subject / each job.
python pytest.py $subject # test python
echo $subject # test basic job array logic
echo $SLURM_ARRAY_TASK_ID # test basic job array logic

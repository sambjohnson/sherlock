#!/bin/bash
#
#SBATCH -J me_fmriprep
#SBATCH --time=5-00:00:00
#SBATCH -n 1
#SBATCH --array 1-5
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G
#SBATCH -p russpold,hns  # Queue names you can submit to
# Outputs ----------------------------------
#SBATCH -o log/%x-%A-%a.out
#SBATCH -e log/%x-%A-%a.err
#SBATCH --mail-user=poldracklab@stanford.edu
#SBATCH --mail-type=END
# ------------------------------------------
SUBJECTS_FILE='path/to/sub/file.txt' 
# Parse the participants.tsv file and extract one subject ID from the line corresponding to this SLURM task.
subject=$( sed "${SLURM_ARRAY_TASK_ID}q;d" ${SUBJECTS_FILE} )

# Compose the command line
cmd="${SINGULARITY_CMD} /data ${DERIVS_DIR} participant --participant-label $subject -w /work/ -v --omp-nthreads 8 --nthreads 12 --mem_mb 30000 --output-spaces MNI152NLin2009cAsym:res-2 anat --fs-subjects-dir /fsdir"

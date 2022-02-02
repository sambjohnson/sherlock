#!/bin/bash
#
#SBATCH --job-name=hbn-archive-download-attempt-4
#
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4G

source /home/groups/jyeatman/software/anaconda3/etc/profile.d/conda.sh
conda activate ni

python test.py

echo "If you can see this, the end of the scipt has been reached."

#!/bin/bash
#
#SBATCH --job-name=hbn-archive-download-attempt-4
#
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4G

echo "bashrc: "
cat .bashrc

echo "bash_profile"
cat .bash_profile

#!/bin/bash
#
#SBATCH --job-name=example
#SBATCH --mem-per-cpu=4G
#SBATCH --time=2:00
#SBATCH --mail-type=ALL

ml reset

# ml load python/3.9.0 # can load modules if desired
# conda activate <your-env> # can activate preferred conda environment

python pytest.py $1

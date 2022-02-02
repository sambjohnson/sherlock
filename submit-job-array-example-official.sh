#!/bin/bash
#SBATCH --array=0-99:10
#SBATCH -n 10

for i in {0..9}; do
    srun -n 1 python pytest.py $((SLURM_ARRAY_TASK_ID+i)) &
done

wait # important to make sure the job doesn't exit before the background tasks are done

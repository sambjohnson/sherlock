# sherlock
### A collection of utility scripts for use with the Sherlock HPC cluster

There are two scripts that can be used to automatically submit multiple jobs to Sherlock, a situation that often arises.

The first collection of scripts is clumsy but simple and self-contained. The second method uses a feature of Sherlock (Slurm) known as job arrays.

As a prototypical example, one might use this to run the same program (e.g., Freesurfer) on many individual subjects. Therefore, these tools all require a .txt file with one subject ID per line. In fact, these need not be subjects; they could be paths to subject's data, or any other input you want to loop through.

# sherlock
### A collection of utility scripts for use with the Sherlock HPC cluster

There are two scripts that can be used to automatically submit multiple jobs to Sherlock, a situation that often arises.

The first collection of scripts is clumsy but simple and self-contained. The second method uses a feature of Sherlock (Slurm) known as job arrays.

As a prototypical example, one might use this to run the same program (e.g., Freesurfer) on many individual subjects. Therefore, these tools all require a .txt file with one subject ID per line. (Actually, the lines of this file need not be subjects; they could be paths to subject's data, or any other input you want to loop through.)

As a first step, download all these files to your Sherlock home directory or wherever you prefer to run scripts.

For method 1:
- This method involves four files: submit-driver.sh, submit-python-example.sh, pytest.py, and substest2.txt.
- First, change parameters in submit-python-example. (This contains all the Slurm job parameters, such as how many CPUs to request and for how long.)
- Second, change what calculation to do. In its original configuration, these scripts will run the python program pytest.py once on each input in substest2.txt
- Third, change the list of subjects (or generally, arguments) to loop over. You will have to supply this yourself, and it is important that each line contain exactly one subject and nothing else.
- To run, type the following command: bash submit-driver.sh submit-python-example.sh substest2.txt
 -- As an initial test, this should submit 10 jobs, one for each subject in substest2.txt
 -- The resulting slurm output files (.out extension) should contain messages displaying the correct subject and checking that Python can load correctly. You can add your own Python code here as a way to check that all the Python functionality you desire can load and run correctly. E.g., you could add import nilearn to the top of pytest.py to check that nilearn can be loaded in Python running in this context.
  

# sherlock
### A collection of utility scripts for use with the Sherlock HPC cluster

There are two scripts that can be used to automatically submit multiple jobs to Sherlock, a situation that often arises.

The first collection of scripts is clumsy but simple and self-contained. The second method uses a feature of Sherlock (Slurm) known as job arrays.

As a prototypical example, one might use this to run the same program (e.g., Freesurfer) on many individual subjects. Therefore, these tools all require a .txt file with one subject ID per line. (Actually, the lines of this file need not be subjects; they could be paths to subject's data, or any other input you want to loop through.)

As a first step, download all these files to your Sherlock home directory or wherever you prefer to run scripts.

For method 1:
- This method involves four files: submit-driver.sh, submit-python-example.sh, pytest.py, and substest2.txt.
- To run, type the following command: `bash submit-driver.sh submit-python-example.sh substest2.txt`. I encourage you to test this before making any changes.
  - As an initial test, this should submit 10 jobs, one for each subject in substest2.txt
  - The resulting slurm output files (.out extension) should contain messages displaying the correct subject and checking that Python can load correctly. You can add your own Python code here as a way to check that all the Python functionality you desire can load and run correctly. E.g., you could add import nilearn to the top of pytest.py to check that nilearn can be loaded in Python running in this context.  
- To adapt this code for your own use, first change parameters in submit-python-example. (This contains all the Slurm job parameters, such as how many CPUs to request and for how long.)
  - Note: you can optionally include your email address if you would like to be notified when these jobs begin/end.
- Second, change what calculation to do. In its original configuration, these scripts will run the python program pytest.py once on each input in substest2.txt
- Third, change the list of subjects (or generally, arguments) to loop over. You will have to supply this yourself, and it is important that each line contain exactly one subject and nothing else.
- To run, type the following command: ```bash submit-driver.sh submit-YOUR-CODE.sh YOUR-SUBJECTS.txt```

For method 2:
- This method involves three files: submit-job-array-example-2.sh, pytest.py, and substest2.txt.
  - To run, type the following command: ```sbatch submit-job-array-example-2.sh substest2.txt```
  - As a test, before making your own modifications, this should create a job array of ten jobs, each with its own .out file. These files should show the correct subject for each respective job as well as a successful python execution. (pytest.py will try to add 3+4; if this doesn't work, there's definitely a problem!)
- To adapt this code for your own use, first change parameters in submit-job-array-example-2.sh. (This file holds the slurm parameters, such as how many CPUs to request and for how long.)
- Second, change what calculation to do. In this case, the script submit-job-array-example-2.sh executes pytest.py, but you can replace this by specifying your own computations. For an example of a different calculation, see submit-fs-template.sh.
- Third, Specify your own subjects file.
  - IMPORTANT: In the current setup, you must manually change the submit script to reflect the number of subjects (lines to read in the subject file).
  - To do this, change the line `#SBATCH --array 1-10` to `#SBATCH --array 1-NumberOfSubjects`.
  - Assuming a properly formatted subject file with one subject per line, you could get this with the linux command `cat your-subjects-file.txt | wc -l`. 
- To run your version, type the following command: ```sbatch submit-job-array.sh YOUR-SUBJECTS.txt```. Your own modifi

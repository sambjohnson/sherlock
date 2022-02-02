#!/bin/bash

SUBMIT=$1
SUBSFILE=$2

for sub in $( cat $SUBSFILE ); do
	sbatch $SUBMIT $sub;
done
echo Driver program completed!

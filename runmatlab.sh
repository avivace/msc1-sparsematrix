#!/bin/bash
DIR=matrices/positive_definite
OUTFILE=out.csv
matlab=~/matlab/bin/matlab

for x in $DIR/*.mat; do
	echo $x
	$matlab -nojvm -nodesktop -r "inputMatrix='$x'; solve" | tail -n 2
done

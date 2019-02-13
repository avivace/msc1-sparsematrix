#!/bin/bash
DIR=matrices/non_positive_definite
OUTFILE=out.csv


for x in $DIR/*.mat; do
	/usr/bin/time -f '%M,%e' matlab -nojvm -nodesktop -r "inputMatrix='$x'; solve" | tail -n 2
done

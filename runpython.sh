#!/bin/bash
DIR=matrices/non_positive_definite
OUTFILE=out.csv


for x in $DIR/*.mat; do
	/usr/bin/time -f '%M,%e' python3 solve.py $x
done

#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Error: Two arguments required - path to directory and search string"
	exit 1;
fi
echo "$1"
echo "$2"

filesdir="$1"
searchstr="$2"

if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
	echo "Error: need to pass some value in parameters"
	exit 1
fi	


if [ ! -d "$filesdir" ]; then
       echo "Error: '$filesdir' is not a directory."
	exit 1
fi
 

numfiles=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "$numfiles"
echo "$num_matching_lines"
echo "The number of files are $numfiles and the number of matching lines are $num_matching_lines in $filesdir"

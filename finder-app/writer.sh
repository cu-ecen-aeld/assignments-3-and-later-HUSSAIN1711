#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required - file path and text string to write."
    exit 1
fi

# Assign arguments to variables for readability
writefile=$1
writestr=$2

# Check if writefile or writestr is empty
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Both file path and text string must be non-empty."
    exit 1
fi

# Extract the directory from the writefile path
writedir=$(dirname "$writefile")

# Check if the directory exists, if not create it
if [ ! -d "$writedir" ]; then
    echo "Directory does not exist. Creating directory: $writedir"
    mkdir -p "$writedir"
    
    # Check if the directory creation was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory '$writedir'."
        exit 1
    fi
else
    echo "Directory '$writedir' already exists."
fi

# Attempt to create/write the file
echo "$writestr" > "$writefile"

# Check if the file creation/writing succeeded
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file '$writefile'."
    exit 1
fi

echo "File '$writefile' created with content: '$writestr'"

#!/bin/bash

# Define the directory to scan
dir="."

# Loop through each subdirectory in the directory
for d in "$dir"/*/; do
  # Get the parent directory name
  parent_dir_name="$(basename "$d")"
  
  # Loop through each file in the subdirectory
  for f in "$d"/*; do
    # Get the file extension
    file_ext="${f##*.}"
    
    # Rename the file
    mv "$f" "$d$parent_dir_name.$file_ext"
  done
done

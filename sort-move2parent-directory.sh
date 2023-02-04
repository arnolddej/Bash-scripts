#!/bin/bash

# prompt the user for the root directory
echo "Enter the root directory path: "
read root_dir

# change to the root directory
cd "$root_dir"

# prompt the user for the number of directories to process
echo "Enter the number of directories to process: "
read count

# loop through the specified number of directories in the root directory
for i in $(seq 1 $count); do
  dir=$(ls -d */ | head -n $i | tail -n 1)

  # remove the trailing "/" from the directory name
  dir=${dir%/}

  # get the name until a "."
  name=$(echo $dir | awk -F "." '{print $1}')

  # skip the directory if there's no "." in the name
  if [ "$name" == "$dir" ]; then
    continue
  fi

  # skip the directory if it contains "_UNPACK_" or "_FAILED_" or spaces
  if [[ $dir = *"_UNPACK_"* ]] || [[ $dir = *"_FAILED_"* ]] || [[ $dir = *" "* ]]; then
    continue
  fi

  # skip the directory if it doesn't contain a date in the format YY.MM.DD
  if [[ ! $dir =~ [0-9][0-9]\.[0-9][0-9]\.[0-9][0-9] ]]; then
    continue
  fi

  # if the name directory doesn't exist, create it
  if [ ! -d "$name" ]; then
    mkdir "$name"
  fi

  # move the directory into the name directory
  mv "$dir" "$name/$dir"
done

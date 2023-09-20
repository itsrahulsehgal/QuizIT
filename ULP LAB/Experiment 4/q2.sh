#!/bin/bash

read -p "Enter the directory path: " directory

if [ ! -d "$directory" ]; then
  echo "Error: The specified directory does not exist."
  exit 1
fi

file_count=$(ls "$directory")

echo "The number of files in $directory is: $file_count"

#!/bin/bash

# Path to the directory you want to clear
DIR_PATH="storage/apps/"

# Make sure the path exists
if [ -d "$DIR_PATH" ]; then
  # Navigate to the directory
  cd "$DIR_PATH"

  # Iterate over all files and directories in the path
  for item in *; do
    # If the item is not the .keep file, delete it
    if [ "$item" != ".keep" ]; then
      rm -rf "$item"
    fi
  done

  # Navigate back to the original directory
  cd -

  echo "Files and folders cleared from $DIR_PATH, except for .keep file."
else
  echo "Directory $DIR_PATH does not exist."
fi

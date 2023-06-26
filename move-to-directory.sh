#!/bin/bash

# Create the target directory
directory_name="negpod_id-q1"
mkdir "$directory_name"

# Move the files to the target directory
mv main.sh "$directory_name"
mv students-list_0333.txt "$directory_name"
mv select-emails.sh "$directory_name"
mv student-emails.txt "$directory_name"

echo "Files moved to directory: $directory_name"

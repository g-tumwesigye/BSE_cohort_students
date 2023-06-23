#!/bin/bash

students_file="students-list_0333.txt"
output_file="student-emails.txt"

# Use awk to extract just the emails from the students file
awk -F',' '{print $1}' "$students_file" > "$output_file"

echo "Emails of the students have been selected and saved in $output_file"


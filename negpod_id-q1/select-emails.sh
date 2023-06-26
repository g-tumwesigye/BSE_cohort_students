#!/bin/bash

filename="students-list_0333.txt"
output="student-emails.txt"

awk -F ', ' '{ print $2 }' $filename > $output

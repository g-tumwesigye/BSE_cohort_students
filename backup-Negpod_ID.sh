#!/bin/bash

# Prompt the user for input
echo "Enter student information. Press Ctrl+C to exit."

# Create an empty array to store student data
students=()

# Read student information until the user decides to exit
while true; do
    read -p "Student email: " email
    read -p "Age: " age
    read -p "Student ID: " student_id

    # Store student information in an associative array
    student=([email]=$email [age]=$age [student_id]=$student_id)

    # Add the student to the array of students
    students+=("$student")

    read -p "Add another student? (y/n): " choice

    # Exit the loop if the user chooses not to add another student
    if [ "$choice" == "n" ]; then
        break
    fi
done

# Generate the cohort list by iterating over the student array
echo "Cohort List:"
for student in "${students[@]}"; do
    email=$(echo $student | awk -F'[ =]' '{print $3}')
    age=$(echo $student | awk -F'[ =]' '{print $6}')
    student_id=$(echo $student | awk -F'[ =]' '{print $9}')
    echo "Email: $email, Age: $age, Student ID: $student_id"
done

# Invoke the select-emails.sh script to extract student emails
./select-emails.sh

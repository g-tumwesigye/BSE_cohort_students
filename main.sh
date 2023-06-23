#!/bin/bash

students_file="students-list_0333.txt"

# Function to create a student record
create_student_record() {
    echo "Enter student email:"
    read email

    echo "Enter student age:"
    read age

    echo "Enter student ID:"
    read id

    # Append student record to the file
    echo "$email,$age,$id" >> "$students_file"

    echo "Student record created successfully!"
}

# Function to view all students
view_all_students() {
    echo "List of students:"
    cat "$students_file"
}

# Function to delete a student by ID
delete_student() {
    echo "Enter student ID to delete:"
    read id

    # Use sed to delete the line containing the given student ID
    sed -i "/^$id,/d" "$students_file"

    echo "Student deleted successfully!"
}

# Function to update a student record by ID
update_student() {
    echo "Enter student ID to update:"
    read id

    # Use sed to find the line containing the given student ID and prompt for updated details
    sed -i "/^$id,/c\\$(get_updated_student_record $id)" "$students_file"

    echo "Student record updated successfully!"
}

# Function to get the updated student record details
get_updated_student_record() {
    local id="$1"

    echo "Enter updated student email:"
    read email

    echo "Enter updated student age:"
    read age

    echo "$email,$age,$id"
}

# Function to display the menu options
display_menu() {
    echo "===== Bachelor of Software Engineering Cohort List Management ====="
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student"
    echo "4. Update student record"
    echo "5. Exit"
    echo "==============================================================="
    echo "Enter your choice:"
}

# Main program loop
while true; do
    display_menu
    read choice

    case $choice in
        1) create_student_record ;;
        2) view_all_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) break ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    echo
done



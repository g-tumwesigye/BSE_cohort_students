#!/bin/bash

filename="students-list_0333.txt"

while true
do
    echo "Please select an option:"
    echo "1. Add student"
    echo "2. View all students"
    echo "3. Delete student by ID"
    echo "4. Update student by ID"
    echo "5. Update student email by ID"
    echo "6. Update student age by ID"
    echo "7. Exit"
    read option

    case $option in
        1)
            echo "Enter email: "
            read email
            echo "Enter age: "
            read age
            echo "Enter student ID: "
            read id
            echo "$id, $email, $age" >> $filename
            ;;
        2)
            cat $filename
            ;;
        3)
            echo "Enter the ID of the student to be deleted: "
            read id
            grep -v "^${id}," "$filename" > temp && mv temp "$filename"
            ;;
        4)
            echo "Enter the ID of the student to be updated: "
            read id
            echo "Enter new email: "
            read email
            echo "Enter new age: "
            read age
            awk -F, -v id="$id" -v email="$email" -v age="$age" 'BEGIN {OFS=","} $1 == id {$2 = email; $3 = age} 1' "$filename" > temp && mv temp "$filename"
            ;;
        5)
            echo "Enter the ID o3f the student whose email to be updated: "
            read id
            echo "Enter new email: "
            read email
            old_age=$(awk -F ', ' -v id="$id" '$1 == id {print $3}' $filename)
            if [ -z "$old_age" ]; then
                echo "No such ID: $id"
            else
                sed -i "/^$id,/c\\$id, $email, $old_age" $filename
            fi
            ;;
        6)
            echo "Enter the ID of the student whose age to be updated: "
            read id
            echo "Enter new age: "
            read age
            old_email=$(awk -F ', ' -v id="$id" '$1 == id {print $2}' $filename)
            if [ -z "$old_email" ]; then
                echo "No such ID: $id"
            else
                sed -i "/^$id,/c\\$id, $old_email, $age" $filename
            fi
            ;;
        7)
            exit 0
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done

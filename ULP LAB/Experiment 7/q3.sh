#!/bin/bash

# Function to check and display file permissions
check_permissions() {
    file="$1"

    if [ -e "$file" ]; then
        echo "File: $file"
        
        # Check read permission
        if [ -r "$file" ]; then
            echo "Read permission: Yes"
        else
            echo "Read permission: No"
        fi

        # Check write permission
        if [ -w "$file" ]; then
            echo "Write permission: Yes"
        else
            echo "Write permission: No"
        fi

        # Check execute permission
        if [ -x "$file" ]; then
            echo "Execute permission: Yes"
        else
            echo "Execute permission: No"
        fi
    else
        echo "File does not exist: $file"
    fi
}

# Main script

# Take user input for the file path
read -p "Enter a file path: " file_path
check_permissions "$file_path"


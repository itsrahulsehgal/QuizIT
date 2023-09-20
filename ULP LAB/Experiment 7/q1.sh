#!/bin/bash

# Function to check file attributes
check_file_attributes() {
    file="$1"
    
    if [ -e "$file" ]; then
        echo "File exists: $file"
        
        if [ -f "$file" ]; then
            echo "Type: Regular File"
        elif [ -d "$file" ]; then
            echo "Type: Directory"
        else
            echo "Type: Other (e.g., symlink, socket)"
        fi
        
        echo "File Size: $(stat -c %s "$file") bytes"
        echo "Permissions: $(stat -c %A "$file")"
        echo "Owner: $(stat -c %U "$file")"
        echo "Group: $(stat -c %G "$file")"
        echo "Last Modified: $(stat -c %y "$file")"
    else
        echo "File does not exist: $file"
    fi
}

# Function to check process attributes
check_process_attributes() {
    process_name="$1"
    
    if pgrep -x "$process_name" >/dev/null; then
        echo "Process exists: $process_name"
        echo "Process ID(s): $(pgrep -x "$process_name" | tr '\n' ' ')"
        echo "Parent Process ID: $(ps -o ppid= -p "$(pgrep -x "$process_name" | head -n 1)")"
        echo "Command Line: $(ps -o cmd= -p "$(pgrep -x "$process_name" | head -n 1)")"
    else
        echo "Process does not exist: $process_name"
    fi
}

# Main script

# Check file attributes
read -p "Enter a file or directory path: " file_path
check_file_attributes "$file_path"

# Check process attributes
read -p "Enter a process name: " process_name
check_process_attributes "$process_name"


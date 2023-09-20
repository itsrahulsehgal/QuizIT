#!/bin/bash

# Function to change process priority
change_process_priority() {
    pid="$1"
    nice_value="$2"

    if [ -n "$pid" ]; then
        if renice "$nice_value" -p "$pid"; then
            echo "Changed process priority (PID $pid) to nice value $nice_value"
        else
            echo "Failed to change process priority (PID $pid)"
        fi
    else
        echo "Please provide a valid PID and nice value."
    fi
}

# Main script

# Take user input for PID and nice value
read -p "Enter the PID of the process: " process_pid
read -p "Enter the new nice value (e.g., -10 for higher priority, 10 for lower priority): " new_nice_value

# Call the function to change process priority
change_process_priority "$process_pid" "$new_nice_value"


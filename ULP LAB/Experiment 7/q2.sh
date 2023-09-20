#!/bin/bash

# Function to list process attributes
list_process_attributes() {
    echo "List of running processes:"
    ps aux | less
}

# Main script
list_process_attributes


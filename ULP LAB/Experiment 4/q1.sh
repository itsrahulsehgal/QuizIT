#!/bin/bash

read -p "Enter a file or directory path: " filepath

if [ -e "$filepath" ]; then
    if [ -d "$filepath" ]; then
        echo "$filepath is a directory."
    else
        echo "$filepath is not a directory."
    fi
else
    echo "$filepath does not exist."
fi


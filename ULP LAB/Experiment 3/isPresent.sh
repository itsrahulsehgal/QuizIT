#!/bin/bash

my_list=("apple" "banana" "cherry" "mango")

read -p "Enter the element you want to search for: " search_element


found=false

for item in "${my_list[@]}"; do
    if [ "$item" == "$search_element" ]; then
        echo "$search_element is present in the list."
        break
    else
        echo "$search_element is not present in the list."
        break
    fi
done

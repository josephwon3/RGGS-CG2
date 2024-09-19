#!/bin/bash

# 3) find a list of strings, loop through files in a directory, and create a prescence list
# Define the three words you want to search for
word1="notamacropus_eugenii"
word2="sarcophilus_harrisii"
word3="monodelphis_domestica"

# Directory where your files are located
directory="/Users/josephwon/mammal_data_analysis"

# Create an empty file to store the list of matching files
output_file="matching_files.txt"
> "$output_file"

# Loop through each file in the directory
for file in "$directory"/*; do
    # Check if the file contains any of the three words
    if grep -qE "$word1|$word2|$word3" "$file"; then
        # If it contains any of the words, append the filename to the output file
        echo "$file" >> "$output_file"
    fi
done

# Print the list of matching files
cat "$output_file"



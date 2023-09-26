#!/bin/bash

# Directory containing the .jemdoc files
dir="."

# Loop through all .jemdoc files in the directory
for file in "$dir"/*.jemdoc; do
    # Check if the file has been modified
    if [[ "$file" -nt "${file%.jemdoc}.html" ]]; then
        # Compile the modified file using jemdoc.py
        python2 jemdoc.py "$file"
        echo "Compiled $file"
    fi
done
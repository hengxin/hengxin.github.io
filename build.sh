#!/bin/bash

dir="."

for file in "$dir"/*.jemdoc; do
    if [[ "$file" -nt "${file%.jemdoc}.html" ]]; then
        python2 jemdoc.py "$file"
        echo "Compiled $file"
    fi
done
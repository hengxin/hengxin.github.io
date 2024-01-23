#!/bin/bash

dir="."

files="update files: "
for file in "$dir"/*.jemdoc; do
    if [[ "$file" -nt "${file%.jemdoc}.html" ]]; then
        files+="$file "
        python2 jemdoc.py "$file"
        echo "Compiled $file"
    fi
done

git add .
git commit -m "$files"
git push origin master
#!/bin/bash

read -p "Do you want to rename folders recursively? (y/N): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Renaming folders recursively..."
    # Recursive: rename all directories, deepest first
    find . -depth -type d | while read -r dir; do
        parent=$(dirname "$dir")
        base=$(basename "$dir")

        newbase=$(echo "$base" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

        if [[ "$base" != "$newbase" ]]; then
            mv -v -- "$dir" "$parent/$newbase"
        fi
    done
else
    echo "Renaming only top-level folders..."
    # Non-recursive: only immediate subdirectories
    for dir in */ ; do
        dirname="${dir%/}"
        newname=$(echo "$dirname" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

        if [[ "$dirname" != "$newname" ]]; then
            mv -v -- "$dirname" "$newname"
        fi
    done
fi

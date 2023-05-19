#!/bin/bash

# Loop through files in the current directory
for file in *; do
    # Skip directories
    if [[ -f $file ]]; then
        # Add executable permission using chmod
        chmod +x "$file"
    fi
done

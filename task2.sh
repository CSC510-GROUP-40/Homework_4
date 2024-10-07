#!/bin/bash

echo "Step 3.a:"
grep -l 'sample' dataset1/* | xargs grep -l 'CSC510' | xargs grep -oE "CSC510" | uniq -c | sed 's/:CSC510//g' | grep ' [3-9]\| [1-9][0-9]+' | while read -r count file; do
    echo "File: $file, Count: $count"
done

echo "Step 3.b and 3.c:"
grep -l 'sample' dataset1/* | xargs grep -l 'CSC510' | xargs grep -oE "CSC510" | uniq -c | sed 's/:CSC510//g' | grep ' [3-9]\| [1-9][0-9]+' | gawk '{
    "stat -f%z " $2 | getline size;  # Get the file size
    print $2, $1, size               # Print the file, occurrences, and file size
}' | sort -k2,2nr -k3,3nr | while read -r file count size; do
    echo "File: $file, Count: $count, Size: $size"

    new_file=$(echo "$file" | sed 's/file_/filtered_/')
    
    # rename the file
    mv "$file" "$new_file"
    
    echo "Renamed $file to $new_file"
done

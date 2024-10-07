#!/bin/bash

# It should be run with MacOS
# If run with Linux, you need to replace -f%z with --format=%s
grep -l 'sample' dataset1/* | xargs grep -l 'CSC510' | xargs grep -oE "CSC510" | uniq -c | sed 's/:CSC510//g' | grep ' [3-9]\| [1-9][0-9]+' | gawk '{
    "stat -f%z " $2 | getline size;                             # Get the file size
    print $2, $1, size                                          # Print the file, occurrences, and file size
}' | sort -k2,2nr -k3,3nr | gawk '{
    "echo " $1 " | sed s/file_/filtered_/" | getline new_file;  # Use sed to generate the new file name
    "mv " $1 " " new_file                                       # Rename the file
    print new_file                                              # Print the new files
}'

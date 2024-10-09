#!/bin/bash

sed 's/\(.*\),/\1,~/' titanic.csv > titanic_fixed_nulls.csv # replace the last comma it exist with ~
sed 's/,,/,~,/g' titanic.csv > titanic_modified.csv #fixes other missing nulls
sed 's/female/F/g' titanic.csv > titanic_modified.csv # replace female with F
sed 's/male/M/g' titanic_modified.csv > titanic_final.csv # replace male with M

# Path to the input CSV file
input_file="titanic_final.csv"  # Replace this with your actual input file

# Run the gawk script
#/opt/homebrew/bin/gawk -f task3.gawk "$input_file"
gawk -f task3.gawk "$input_file"
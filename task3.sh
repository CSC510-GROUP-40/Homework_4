#!/bin/bash

sed 's/\(.*\),/\1,~/' titanic.csv | sed 's/,,/,~,/g' | sed 's/female/F/g' | sed 's/male/M/g' | gawk -f task3.gawk
#! /bin/bash

#create a report file for a single shipping container
#Exercise: Add a variable called 'directory'
# that determines where the report file is saved

directory=reports 
mkdir -p $directory
grep $1 shipments.csv > $directory/$1.csv

echo Report created

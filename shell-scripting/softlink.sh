#!/bin/bash
# This script creates a soft link to a file
# prompt the user to input a directory path or use the default path
read -p "Enter the directory path (default: /tmp/shell-scripting): " dir_path

# create a two folders in local directory
mkdir -p "$dir_path/softlink1/softlink2"
# create a file in softlink2 folder
touch "$dir_path/softlink1/softlink2/file1"
#create a tmp folder in local directory
mkdir -p "$dir_path/tmp"
# create a soft link to file1 in tmp folder
ln -s "$dir_path/softlink1/softlink2/file1" "$dir_path/tmp/file1"
echo "Soft link to file1 created in $dir_path/tmp"
# check the soft link
ls -l "$dir_path/tmp/file1"
# insert some data in the softlink2 folder file1
echo "Hello World" > "$dir_path/softlink1/softlink2/file1"
echo "Data inserted in softlink2 folder file1"
cat "$dir_path/softlink1/softlink2/file1"
# check the soft link in tmp folder
echo "Checking the soft link in tmp folder"
cat "$dir_path/tmp/file1"
# remove the soft link file from softlink2 folder 
rm "$dir_path/softlink1/softlink2/file1"
# check the soft link in tmp folder
ls -ltr "$dir_path/tmp/file1"
cat "$dir_path/tmp/file1"
# remove the softlink2 folder & softlink1 folder 
rm -rf "$dir_path/softlink1"
echo "Softlink2 folder & softlink1 folder removed"
# remove the tmp folder
rm -rf "$dir_path/tmp"
echo "Tmp folder removed"
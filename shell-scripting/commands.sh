#!/bin/bash
# I have created a new file called fruits.txt and inside I have fruits names. I want to grep Apple from the file.
grep "apple" fruits.txt

#Search for lines containing the word "banana" case-insensitively in all .txt files in the current directory.
grep -i "banana" *.txt

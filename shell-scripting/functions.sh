#!/bin/bash
# Define a function
function greet() {
    echo "Hello $1, you are $2 years old."
}
# Call the function
greet "John" 25 

echo "Argument 1: $1"
echo "Argument 2: $2"
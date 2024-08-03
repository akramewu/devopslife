#!/bin/bash

# Define a function for calculator project
# Function to add two numbers
function add() {
    echo "The sum of $1 and $2 is $(($1 + $2))"
}

# Function to subtract two numbers
function subtract() {
    echo "The difference of $1 and $2 is $(($1 - $2))"
}

# Function to multiply two numbers
function multiply() {
    echo "The product of $1 and $2 is $(($1 * $2))"
}

# Function to divide two numbers
function divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero!"
    else
        echo "The division of $1 by $2 is $(($1 / $2))"
    fi
}

# Main script starts here
echo "Enter two numbers: "
# Read two numbers
read -p "Enter first number 1: " num1
read -p "Enter second number 2: " num2

# Display the menu options
echo "Select an operation: "
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read -p "Enter your choice: " choice

# Perform the operation based on the choice
case $choice in
    1)
        add $num1 $num2
        ;;
    2)
        echo "The difference of $num1 and $num2 is $(($num1 - $num2))"
        ;;
    3)
        echo "The product of $num1 and $num2 is $(($num1 * $num2))"
        ;;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero!"
        else
            echo "The division of $num1 by $num2 is $(($num1 / $num2))"
        fi
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac
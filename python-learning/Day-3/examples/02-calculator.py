# write calculator program using various functions and variables input from user

number1 = int(input("Enter first number: "))
number2 = int(input("Enter second number: "))

def add():
    print ("Addition: ", number1 + number2)

def subtract():
    print ("Subtraction: ", number1 - number2)

def multiply():
    print ("Multiplication: ", number1 * number2)

def divide():
    print ("Division: ", number1 / number2)

add()
subtract()
multiply()
divide()
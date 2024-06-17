#Write a function that takes two numbers as input and divides the first number by the second number. Raise a ZeroDivisionError if the second number is zero.

def division(a,b):
    if b == 0:
        raise ZeroDivisionError("Division by zero is not possible. Please try again with a non-zero number.")
    else:
        return a/b

try:
    division(10,0)
except ZeroDivisionError:
    print("Error: Division by zero not allowed.")

#Create a function that checks if a given string is a palindrome. Raise a custom PalindromeError if the input is not a valid string.
# function which return reverse of a string
class PalindromeError(Exception):
     pass
def isPalindrome(string):
    isPal = False
    if(string == string[::-1]):
            isPal=True
    else:
         raise PalindromeError(f"{string} is not a palindrome.")
    return isPal


strings = ["MOM", "word"]
for string in strings:
    try:
        if(isPalindrome(string)):
            print(f"{string} is a palindrome")
    except PalindromeError as e:    
        print(e)
#Write a Python script that iterates through a list of integers and attempts to divide each integer by zero. Handle the ZeroDivisionError exception within a try-except block, and use a finally block to print a message indicating the end of the iteration process.

list1 =[1,2,3,4,5,6]

try:
    for num in list1:
        res = num/0
        print(res)
except ZeroDivisionError:
    print("Cannot divide by zero.")
finally:
    print("Completed")
#Write a Python function that attempts to divide two numbers and handles the ZeroDivisionError exception. Include a finally block to print a message indicating the end of the division operation.
def division(a,b):
    if b == 0:
        raise ZeroDivisionError("Division by zero is not possible. Please try again with a non-zero number.")
    else:
        return a/b

try:
    division(10,0)
    division(20,2)
except ZeroDivisionError:
    print("Error: Division by zero not allowed.")
finally:
    print("Division completed!")

#Create a Python program that converts a string to an integer. Handle the ValueError exception if the string cannot be converted to an integer, and print a message indicating the error.
try:
    string = "Hello world"
    number = int (string)
    print("Value: "+num)
except ValueError:
    print("Cannot conver string into int.")
#Write a Python function that takes a number as input and returns its square root. Handle the case where the input is a negative number by raising a custom exception called NegativeNumberError.
import math
class NegativeNumberError(Exception):
    pass
def sqr(num):
    
    if(num>=0):
        print(math.sqrt(num))
    else:
        raise NegativeNumberError("Negative number is not allowed.")
    
try:
    num = int(input("Enter any number: "))
    sqr(num)
except NegativeNumberError as e:
    print(e)
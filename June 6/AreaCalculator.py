# This code calculates the area of different shapes.

import math
def calculateArea(shape,dimensions):
    if(shape == "Rectangle"):
        length,width = dimensions
        print("Area: ",length * width)
    elif(shape == "Circle"):
        radius = dimensions
        print("Area: ",(math.pi * radius * 2))

    

print("1. Rectangle")
print("2. Circle")

choice = int(input("Choose any option given above: "))
if( choice == 1):
    length = int(input("Enter length: "))
    width = int(input("Enter width: "))
    calculateArea("Rectangle",(length,width))
elif(choice == 2):
    radius = int(input("Enter radius: "))
    calculateArea("Circle", radius)


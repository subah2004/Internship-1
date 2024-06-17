# These are the various sepcial method used to create and returning instance of a class
class Person:
      #__ new__ method is responsible for creating and returning the instance of the class.

    def __new__(cls,*args,**kwargs):
        return super(Person,cls).__new__(cls)

    # __ init __ method is used to initialize the object attributes when an instance of class is created.
    def __init__(self ,name, age):
        self.name = name
        self.age = age

    #__ str__ method is used to convert objects into string for string representation
    def __str__(self):
        return f"{self.name} ({self.age})"

person1 = Person("John", 25)
print(person1)
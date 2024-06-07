

class Person:
      #__ new__ method

    def __new__(cls,*args,**kwargs):
        return super(Person,cls).__new__(cls)

    # __ init __ method
    
    def __init__(self ,name, age):
        self.name = name
        self.age = age

    #__ str__ method
    def __str__(self):
        return f"{self.name} ({self.age})"

person1 = Person("John", 25)
print(person1)
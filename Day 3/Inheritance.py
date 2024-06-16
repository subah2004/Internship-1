#Inheritance Practice Question 1

class Animal:
    def __init__(self,name):
        self.name= name
    def make_sound(self):
        print("Generic sound")
class Dog(Animal):
    def make_sound(self):
        print("Woof!")
class Cat(Animal):
    def make_sound(self):
        print("Meow")
class Poodle(Animal):
    def make_sound(self):
        pass
dog = Dog("Alice")
cat = Cat("Lua")
dog.make_sound()
cat.make_sound()

# Inheritance Practice Question 2
class Person:
    def __init__(self,name,age,grade):
        self.name =name
        self.age = age
        self.grade = grade
    def display(self):
        print(f"Hi, I'm {self.name} and I'm {self.age} years old.")
        print(f"I'm in grade {self.grade}")
class Student(Person):
    def __init__(self,name,age,grade,percentage):
        super().__init__(name, age,grade)
        self.percentage = percentage
    def display(self):
        super().display()
        print(f"Percentage in {self.grade} is {self.percentage} %")

person = Person("Lua", 20,11)
person.display()


student = Student("Jose", 18, 12,95)
student.display() 

class Addition :
    
#This code uses parameterized constructors. The task of constructors is to assign the value to the data members of class
    def __init__(self,num1, num2):
        self.num1 = num1
        self.num2= num2
    def display(self):
        print(self.num1,"+",self.num2,"=",str(self.answer) )
    
    def calculate(self):
        self.answer = self.num1 + self.num2;

    

add1 = Addition(2,5)
add1.calculate()
add1.display()
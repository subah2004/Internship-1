#This code checks if the number is even or odd.
#This code checks if the number is prime or not.
#The methods are static.

class MathsUtilities:
    @staticmethod
    def iseven(num):
        if(num %2 == 0):
            print("The number is even.")
        else:
            print("The number is odd")
    @staticmethod
    def isPrime(num):
        isPrime = True
        if(num <=2):
            isPrime= False
        else:
            for i in range(2,(num//2)+1):
                if(num% i == 0):
                    isPrime = False
        
        if(isPrime):
            print("The number is prime")
        else:
            print("The number is not prime")
obj1 = MathsUtilities.iseven(4)
obj2 = MathsUtilities.isPrime(4)
obj3 = MathsUtilities.isPrime(5)
obj4 = MathsUtilities.iseven(5)


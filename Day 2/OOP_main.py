class Calculator:
   
    def add(self, x, y):
        return x + y

    def subtract(self, x, y):
        return x - y

    def multiply(self, x, y):
        return x * y

    def divide(self, x, y):
        if y != 0:
            return x / y
        else:
            return ("Cannot divide by zero.")


calculator = Calculator()

result = calculator.add(100, 205)
print("100 + 205 =", result)


result = calculator.subtract(300, 210)
print("300 - 210 =", result)


result = calculator.multiply(90, 40)
print("90 * 40 =", result)


result = calculator.divide(20, 2)
print("20 / 2 =", result)


result = calculator.divide(100, 0)
print("100 / 0 =", result)
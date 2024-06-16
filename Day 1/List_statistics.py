#This code calculates the max, min and average and returns the value in dictonary.
def analyze_list(numbers):
    minimum = min(numbers)
    maximum = max(numbers)
    sum = 0
    for i in numbers:
        sum+=i
    average = sum/(len(numbers))
    dict = {"Minimum":minimum,"Maximum":maximum,"Average":average}
    print(dict)
numbers =[10,20,30,40,50]
analyze_list(numbers)

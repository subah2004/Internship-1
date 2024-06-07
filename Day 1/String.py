#This code reverse the order of words in the string while maintaining the order of characters within each word.

def reverse(string):
    words = string.split()
    reversed_string = words[::-1]
    joined_string = " ".join(reversed_string)
    print(joined_string) 

string = "This is a string."
reverse(string)
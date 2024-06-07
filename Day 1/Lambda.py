#This code provides the list of shortest names using lambda and filter function.
def filter_shortNames(product_names, max_length):
    names = list(filter(lambda x:(len(x)<=max_length) ,product_names))
    print("List of shortest names: ",names)
product_names = [
    "Solar",
    "EcoBreeze",
    "Smartwatch",
    "Yoga Mat",
    "Water Bottle",
    "ZenHarmony",
    "PowerBoost Portable Charger",
    "FreshBlend Juicer",
    "GlideTech Wireless Earbuds",
    "LuminaSmart LED Bulbs"
]
length = 9
filter_shortNames(product_names,length)

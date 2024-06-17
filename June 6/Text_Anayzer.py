# This code counts the  words , characters and most frequent word.
def analyze_text(text):
    StringList = text.split()
    countWords = len(StringList)
    countChar = 0
    for i in text:
        countChar+=len(i)

    word_counts = {}
    for word in StringList:
        if word in word_counts:
            word_counts[word] += 1
        else:
            word_counts[word] = 1
    
    most_frequent_word = max(word_counts, key=word_counts.get)
    
    result = {
        'word_count': countWords,
        'character_count': countChar,
        'most_frequent_word': most_frequent_word
    }
    print(result)


message = "Hello, I'm Subah Sembhi. Nice to meet you. you are amazing."
message2 = "She sells seashells by the seashore, and she sells them very well."
analyze_text(message)
analyze_text(message2)
def is_pangram(sentence):
    return 26 == len(set(filter(str.isalpha, sentence.lower())))

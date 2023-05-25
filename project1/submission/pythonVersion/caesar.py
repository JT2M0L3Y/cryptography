import random

#generate dictionary and store in key_file
def key_gen():
    # new dict
    # col 0 = ordered alphabet
    # col 1 = random alphabet

    arr = list(range('A', 'Z'))
    key = dict(arr, random.shuffle(arr))
    # 1 arrays (A->Z)
    #  
    return key

    # return random.randint(1,25)  


def encrypt(ch,key):
    #return dict[ch]

    #pos = ord(ch) - ord('A') #remove
    #pos = (pos + key) % 26 #remove
    #pos = pos + ord('A') #remove
    return chr(pos) #remove

def decrypt(ch,key):
    # dict passed in, create new dict with swapped k & v pairs
    inverted_dict = {v: k for k, v in key.items()}
    
    # return new_dict[ch]
    return inverted_dict[ch]
    

    #pos = ord(ch) - ord('A') # remove
    #pos = (pos- key) % 26  # remove
    #pos = pos + ord('A') # remove
    #return chr(pos) # remove


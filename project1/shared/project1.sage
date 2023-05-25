'''
Assignment Name: Project 1
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''


import random
def key_gen():
    # create 1D alphabet list
    arr = list(map(chr, range(ord('A'), ord('Z')+1)))

    # generate dictionary with randomized alphabet
    return dict(map(lambda k, v: (k,v), arr, random.sample(arr, len(arr))))

def encrypt(ch,key):
    lower = False

    # flag upper/lower case
    if ord(ch) >= 97 and ord(ch) <= 122:
        lower = True
        ch = chr(ord(ch) - 32)

    return chr(ord(key[ch]) + 32) if lower==True else key[ch]

def decrypt(ch,key):
    lower = False

    # flag for lower case
    if ord(ch) >= 97 and ord(ch) <= 122:
        lower = True
        ch = chr(ord(ch) - 32)

    # invert key
    key_i = {v: k for k, v in key.items()}
    
    # decrypt, convert to lower if needed
    return chr(ord(key_i[ch]) + 32) if lower else key_i[ch]

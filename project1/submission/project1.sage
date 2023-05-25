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

    # key in dictionary
    key = dict(map(lambda k, v: (k,v), arr, 
                random.sample(arr, len(arr))))

    # inverted key in dictionary
    key_i = {v: k for k, v in key.items()}

    return key, key_i

def encrypt(ch,key):
    return key[ch]

def decrypt(ch,key):
    return key[ch]

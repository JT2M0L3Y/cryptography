'''
Assignment Name: Project 4
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''


import random
def key_gen():
    random.seed("hello")

    # randomly generate beta
    beta = random.randint(1, 25)

    # randomly generate alpha
    choices = set([1,3,5,7,9,11,15,17,19,21,23,25])
    alpha = random.choice(tuple(choices))

    # compute alpha inverse
    alpha_inverse = alpha.inverse_mod(26)

    return tuple([("a",int(alpha)), ("a_i",int(alpha_inverse)), ("b", int(beta))])

def encrypt(ascii_ch,key):
    return chr(((key[0] * ascii_ch) + key[2]) % 26 + ord('A'))

def decrypt(ascii_ch,key):
    return chr((key[1] * (ascii_ch - key[2])) % 26 + ord('A'))

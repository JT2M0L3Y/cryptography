import os
os.system('sage --preparse project4.sage')
os.system('mv project4.sage.py project4.py')
import project4 as ciph 
import json

def init(args):
    mode = args[1]
    key_file = open(args[2],'r')
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key_file, fin, fout    

def process(args):
    mode, key_file, fin, fout = init(args)

    key = tuple(json.load(key_file).values())

    data = fin.read().upper()
    for ch in data:
        if (ch.isalpha()):
            if (mode == 'enc'):
                ch = ciph.encrypt(ord(ch) - ord('A'),key)
            if (mode == 'dec'):
                ch = ciph.decrypt(ord(ch) - ord('A'),key)
        fout.write(ch)

    fin.close()
    fout.close()

def write_key(file_name):
    key_file = open(file_name,'w') 
    key = ciph.key_gen()

    # convert key tuple to dict
    key_dict = dict((x,y) for x,y in key)

    json.dump(key_dict, key_file)

    key_file.close()

'''
usage: python3 caesar_tst.py mode key_file input output
#where:
 mode is enc or dec
 key_file is the name of the file containing the key
 input is the name of the file containing text to be encrypted/decrypted
 output is the name of the file containing the result of the encrypt/decrypt operation 
'''
def main():
    #generate, store key
    if len(sys.argv) == 2:
        write_key(sys.argv[1])
        return

    #encrypt or decrypt
    process(sys.argv)
main()


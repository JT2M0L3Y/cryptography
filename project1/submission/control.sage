import os
os.system('sage --preparse project1.sage')
os.system('mv project1.sage.py project1.py')
import project1 as ciph 
import json

def init(args):
    mode = args[1]
    key_file = open(args[2],'r')
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key_file, fin, fout    

def process(args):
    mode, key_file, fin, fout = init(args)

    keys = []
    for line in key_file:
        keys.append(json.loads(line))

    data = fin.read().upper()
    for ch in data:
        if (ch.isalpha()):
            if (mode == 'enc'):
                ch = ciph.encrypt(ch,keys[0])
            if (mode == 'dec'):
                ch = ciph.decrypt(ch,keys[1])
        fout.write(ch)

    fin.close()
    fout.close()

def write_key(file_name):
    key_file = open(file_name,'w') 
    key, key_i = ciph.key_gen()

    json.dump(key, key_file)
    key_file.write(str("\n"))
    json.dump(key_i, key_file)

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


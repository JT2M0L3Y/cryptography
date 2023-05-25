import os
os.system('sage --preparse rsa.sage')
os.system('mv rsa.sage.py rsa.py')
import rsa as ciph

def process(args):
   mode = args[1]

   if mode == "key_gen":
      pub = open(args[2], 'w')
      priv = open(args[3], 'w')

      n, e, d = ciph.key_gen(100)

      pub.write(str(n) + ", " + str(e))
      priv.write(str(d))
   elif mode == "encrypt":
      fin = open(args[2], 'r')
      fout = open(args[3], 'w')
      pub = open(args[4], 'r')

      plaintext = fin.read().rstrip()
      key = pub.read().strip().split(", ")

      txt_lst = ciph.encrypt(plaintext, key[1], key[0])

      ciphertext = ""
      for chunk in txt_lst:
         ciphertext += str(chunk) + ", "
      ciphertext = ciphertext[0:-2]

      fout.write(ciphertext)
   elif mode == "decrypt":
      fin = open(args[2], 'r')
      fout = open(args[3], 'w')
      pubf = open(args[4], 'r')
      privf = open(args[5], 'r')

      ciphertext = fin.read().rstrip().split(",")
      pub = pubf.read().strip().split(",")
      d = privf.read()

      plaintext = ciph.decrypt(ciphertext, d, pub[0])

      fout.write(plaintext)

      
process(sys.argv)


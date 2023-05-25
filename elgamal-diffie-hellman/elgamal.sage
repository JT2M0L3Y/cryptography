'''
Assignment Name: Project 8
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''

def param_gen(size):
  p = random_prime(2**size)
  a = primitive_root(p)
  return p, a

def key_gen(p, a):
  A = randrange(p - 1)
  B = power_mod(a, A, p)
  while B == 1:
    A = randrange(p - 1)
    B = power_mod(a, A, p)
  return A, B

def sign(m, p, a, B):
  t = (p - 1).coprime_integers(30)
  k = t[randrange(len(t))]
  while gcd(k, p) != 1:
    k = t[randrange(len(t))]

  K = power_mod(B, k, p)
  c1 = power_mod(a, k, p)
  c2 = power_mod(K * m, 1, p)
  return c1, c2

'''
def dec(p, A, c1, c2):
  K = power_mod(c1, A, p)
  K_inv = K.inverse_mod(p)
  m = power_mod(c2 * K_inv, 1, p)
  return m
'''

##### Functions from 'txt_num_conv.sage'

#Converts a string to a decimal digit sequence
def txt_to_num(msg_in):      
  #transforms string to the indices of each letter in the 8-bit ASCII table
  #ex: "AB" becomes [65,66]
  msg_idx = list(map(ord,msg_in))

  #The integers in the list, since they are ASCII, are in the range 0..255
  #These are treated, collectively, as a base 256 integer, but from left to right
  #rather than right to left
  #This sequence of integers is converted to base 10 
  #ex: [65,66] = 65*256^0 + 66*256^1 = 16961
  num = ZZ(msg_idx,256)
  return num 

#Converts a digit sequence to a string
def num_to_txt(num_in):
  #transforms the base 10 num_in to a list of base 256 digits. 256^0 is on the left 
  msg_idx = num_in.digits(256)

  #maps each index to its associated character in the ascii table 
  m = map(chr,msg_idx)

  #transforms the list to a string
  m = ''.join(m)
  return m

def main():
  fout = open("elgamal.txt", "w")
  p, a = param_gen(100)

  # gen key
  A, B = key_gen(p, a)

  # encrypt signature
  m = 62
  r, S = sign(m, p, a, B)

  '''
  # decrypt signature
  m = dec(p, A, r, S)
  '''

  fout.write(str(m) + "\n")
  fout.write(str(r) + "\n")
  fout.write(str(S) + "\n")
  fout.write(str(p) + "\n")
  fout.write(str(a) + "\n")

if __name__=="__main__":
  main()


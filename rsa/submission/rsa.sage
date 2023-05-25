'''
Assignment Name: Project 5
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''

def key_gen(size):
  # generate two random primes
  p = random_prime(2**size)
  q = random_prime(2**size)

  # compute n 
  n = p * q

  # set e
  e = 17

  # compute private key 'd'
  d = inverse_mod(e, (p - 1) * (q - 1))

  return n, e, d


def encrypt(plain_text, e, n):
  plain = txt_to_num(plain_text)
  plain = str(plain)

  lst = []

  # encrypt chunk of integer
  while len(plain) > 3:
    lst.append(power_mod(int(plain[0:3]), int(e), int(n)))
    plain = plain[3:]

  lst.append(power_mod(int(plain), int(e), int(n)))

  return lst


def decrypt(c, d, n):
  plain = ""

  for chunk in c[0:-1]:
    chunk = power_mod(int(chunk), int(d), int(n))
    if len(str(chunk)) == 3:
      plain += str(chunk)
    else: 
      while(len(str(chunk)) < 3):
        chunk = "0" + str(chunk)
      plain += str(chunk)
  chunk = c.pop(-1)
  chunk = power_mod(int(chunk), int(d), int(n))
  plain += str(chunk)

  plain = num_to_txt(int(plain) + 0)

  return plain


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

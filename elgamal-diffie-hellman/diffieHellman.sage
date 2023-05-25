'''
Assignment Name: Project 8
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''

def param_gen(size):
  p = random_prime(2**size)
  q = primitive_root(p)
  return p, q

def Alice(p, q):
  a = randrange(p - 1)
  A = power_mod(q, a, p)
  return A, a

def Bob(p, q):
  b = randrange(p - 1)
  B = power_mod(q, b, p)
  return B, b

def Alice_Key(p, a, B):
  return power_mod(B, a, p)

def Bob_Key(p, b, A):
  return power_mod(A, b, p)

def main():
  p, q = param_gen(100)

  A, a = Alice(p, q)

  B, b = Bob(p, q)

  k_alice = Alice_Key(p, a, B)

  k_bob = Bob_Key(p, b, A)

  if (k_alice == k_bob):
    print("Success")
  else:
    print("No Success")

  print(str(k_alice))
  print(str(k_bob))

if __name__=="__main__":
  main()

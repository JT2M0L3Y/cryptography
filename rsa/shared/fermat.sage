'''
Assignment Name: Project 5
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''

def fermat(n):
  fin = open("fermat_fact.out", 'w')

  if is_prime(n):
    print(str(n) + " is prime.")
    print("Factors: " + str(1) + " and itself")
    return

  if n.is_square():
    print(str(n) + " is a perfect square.")
    print("Factors: " + str(int(n.sqrt())) + " " + str(int(n.sqrt())))
    return
  

  k = 1
  squared = n + 1
  while not squared.is_square():
    print(str(k) + "\t" + str(squared))
    fin.write(str(k) + "\t" + str(squared) + "\n")

    k += 1
    squared = n + k**2
  
  print(str(k) + "\t" + str(squared))
  fin.write(str(k) + "\t" + str(squared) + "\n")

  fact1 = int(sqrt(squared) + k)
  fact2 = int(sqrt(squared) - k)

  print("Factors: " + str(fact1) + " " + str(fact2))
  fin.write("Factors: " + str(fact1) + " " + str(fact2) + "\n")


  
fermat(119143)
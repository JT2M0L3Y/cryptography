'''
Assignment Name: Project 10
Name 1: Jonathan Smoley
Name 2: Samuel Sovi
GitHub Name: JT2M0L3Y
'''

import math

def padding(m):
  i = 16 - (len(m) % 16)
  m1 = list(ord(c) for c in m)
  for x in range(i):
    m1.append(i)
  return m1

def checksum(m, s):
  cs = list(0 for i in range(16))
  l = 0
  for i in range(len(m)//16):
    for j in range(16):
      c = m[16*i + j]
      cs[j] = cs[j] ^^ s[c ^^ l]
      l = cs[j]
  return m + cs

def hash(m, s):
  x = list(0 for i in range(48))
  for i in range(len(m)//16):
    for j in range(16):
      x[j + 16] = m[16*i + j]
      x[j + 32] = x[j + 16] ^^ x[j]
    t = 0
    for j in range(18):
      for k in range(48):
        t = x[k] ^^ s[t]
        x[k] = t
      t = (t + j) % 256
  return x[:16]

def make_S():
  p = str(numerical_approx(pi, digits=256*6))
  p = str(3) + p[2:]
  lst = []
  c = 0
  while len(lst) < 256:
    b = p[c:c+3]
    lst.append(int(b) % 256)
    c += 3
  return lst

def md2(msg):
  s = make_S()
  padded = padding(msg)
  cksm = checksum(padded, s)
  hs = hash(cksm, s)
  hs = [chr((hs[x] % 26) + 65) for x in range(len(hs))]
  s = "".join(x for x in hs)
  print(s)

def main():
  md2("A dog")
  md2("A cog")
  md2("To see a World in a Grain of Sand")
  md2("A dog")

if __name__ == "__main__":
  main()

from sage.crypto.block_cipher.sdes import SimplifiedDES

sdes = SimplifiedDES();

P = [0, 0, 0, 0, 0, 0, 0, 0]
K = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

ciphtext = sdes.encrypt(P, K)
print("1. " + str(ciphtext))
msg = sdes.decrypt(ciphtext, K)
print("1. " + str(msg))

P = [0, 0, 0, 0, 1, 1, 1, 1]
K = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1]

ciphtext = sdes.encrypt(P, K)
print("2. " + str(ciphtext))
msg = sdes.decrypt(ciphtext, K)
print("1. " + str(msg))

P = [1, 1, 1, 1, 1, 1, 1, 1]
K = [0, 0, 1, 1, 0, 0, 1, 1, 0, 0]

ciphtext = sdes.encrypt(P, K)
print("3. " + str(ciphtext))
msg = sdes.decrypt(ciphtext, K)
print("1. " + str(msg))

P = [1, 1, 1, 1, 0, 0, 0, 0]
K = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

ciphtext = sdes.encrypt(P, K)
print("4. " + str(ciphtext))
msg = sdes.decrypt(ciphtext, K)
print("1. " + str(msg))

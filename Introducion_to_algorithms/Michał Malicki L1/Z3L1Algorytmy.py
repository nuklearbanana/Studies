
import numpy as np
from numpy import random
# Eliminacja Gaussa
def eliminacja(n):
    
    A = random.randint(10,size=(n,n+1))
    k = 0
    print(A)
    for j in range(n):
        if k >= n+1:
            return
        i = j
        while A[i, k] == 0:
            i += 1
            if i == n:
                i = j
                k += 1
                if n+1 == k:
                    return

        A[[i, j]] = A[[j, i]]

        if A[j, k] != 0:
            A[j] = ( A[j] / A[j, k] )

        for i in range(n):
            if i != j:
                A[i] = A[i] - ( A[j] * A[i,k] )

        k += 1
    print(A)

eliminacja(3)


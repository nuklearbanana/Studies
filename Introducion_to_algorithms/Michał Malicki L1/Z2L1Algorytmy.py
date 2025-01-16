
import numpy as np
from numpy import random
def space(L,M):
    A = random.randint(10,size=(L,M))
    B = random.randint(10,size=(L,M))
    answer = np.linalg.norm(A - B)
    return answer

print(space(3,4))
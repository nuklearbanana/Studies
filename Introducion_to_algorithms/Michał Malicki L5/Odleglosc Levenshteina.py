import numpy as np

def odleglosc_levenshteina(text_a,text_b):
    a = len(text_a)
    b = len(text_b)

    if a == 0 and b == 0:
        return 0
    elif a > 0 and b == 0:
        return a
    elif a == 0 and b > 0:
        return b
    else:
        matrix = np.zeros([a+1,b+1],dtype = int)
        matrix[:,0] = np.arange(a + 1)
        matrix[0,:] = np.arange(b + 1)

        for i in range(1, a + 1):
            for j in range(1, b + 1):
                if text_a[i - 1] == text_b[j - 1]:
                    value = 0
                else:
                    value = 1
                
                matrix[i][j] = min(matrix[i-1][j] + 1, matrix[i][j-1] + 1,matrix[i-1][j-1] + value)
        
        return matrix[a,b]

print(odleglosc_levenshteina("abcd","abd"))
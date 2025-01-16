
import numpy as np
from numpy import random

def Rozmiar(m,n):
    #generowanie macierzy

    x = np.linspace(2,5.5,8)
    y = random.choice(x,size=(m,n))
    
    #niezaliczonych n przedmiotów

    a = np.where(y == 2)
    a = list(zip(a[0],a[1]))
    A = np.array(a)
    index,nindex = np.unique(A[:, 0],return_counts=True)

    k = nindex >= 3
    aanswer = np.count_nonzero(k)
    np.count_nonzero
    # aanswer
    
    #oceny uczniów z max i min średnią

    max = np.argmax(np.mean(y,axis=1))
    min = np.argmin(np.mean(y,axis=1))
    banswer = ["Najwyzsza: ",list(y[max,:]),"Najnizsza: ",list(y[min,:])]
    #banswer
    
    #numer studenta z najw. średnią najw. ocen
    
    max = np.max(y,axis=1)
    cn = []
    for i in range(len(max)):    
        cn.append(np.count_nonzero(y[i] == max[i]))
    canswer = np.argmax(cn)
    #canswer
    
    #obliczanie histogramów

    #śrenie nie niższe niż 4.5
    x = np.average(y,axis=1)
    eanswer = list(np.where(x >= 4.5)[0])
    
    return aanswer,banswer,canswer,eanswer

print(Rozmiar(100,5))
    


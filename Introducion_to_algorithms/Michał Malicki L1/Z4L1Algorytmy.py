
import numpy as np

paragon = np.array([[1, 101, 2],[1, 102, 1],[2, 101, 3],[2, 103, 2],[3, 102, 1],])
towary = np.array([[101, 5.0, 'sztuka'],[102, 8.0, 'sztuka'],[103, 12.0, 'kg']])

def Check(paragon,towary):
    paragon = paragon.T
    towary = towary.T
    condition_one = np.isin(paragon[1],towary[0].astype(int))
    condition_two = False
    for i in range(len(towary[2])):
        if towary[2][i] == 'sztuka':
            condition_two = True
    if condition_one and condition_two:
        return "Paragon jest poprawny"    
    else:
        return "Paragon jest niepoprawny"

Check(paragon,towary)

def Cost(paragon,towary):
    paragon = paragon.T
    towary = towary.T
    condition = np.isin(towary[0],paragon)
    prices = []
    keys1 = towary[0]
    values1 = towary[1].astype(float)
    dic = dict(zip(keys1, values1))
    clients = np.unique(paragon[0])
    for i in range(len(towary)):
        if condition[i]:
            prices.append(towary[1][i])
    resolve = []
    for i in range(len(clients)):  
        client = clients[i]  
        value = 0
        for j in range(len(paragon[1])):
            if client == paragon[0][j]:
                price = dic[str(paragon[1][j])]
                value = value + int(paragon[2][j])*price
        resolve.append([f"Numer klienta: {client}, Wartosc paragonu: {value}"])    
    return resolve
        
#print(Cost(paragon,towary))




#sortowanaie bąbelkowe

def sortowanie_babelkowe(dane):
    for j in range(len(dane)):
        for i in range(len(dane)-1):
            if dane[i] > dane[i+1]:
                temp = dane[i]
                dane[i] = dane[i+1]
                dane[i+1] = temp
#sortowanie przez wstawianie

def sortowanie_wstawianie(dane):
    for i in range(1, len(dane)):
        key = dane[i]
        j = i - 1
        while j >= 0 and dane[j] > key:
            dane[j + 1] = dane[j]
            j -= 1
        dane[j + 1] = key



#sortowanie przez wybór

def sortowanie_wybieranie(dane):
    for i in range(len(dane)):
        min_index = i
        for j in range(i+1, len(dane)):
            if dane[j] < dane[min_index]:
                min_index = j
        dane[i], dane[min_index] = dane[min_index], dane[i]

#modyfikacja sortowania bąbelkowego
def sortowanie_babelkowe_m1(dane):
    for j in range(len(dane)):
        W = False
        for i in range(len(dane)-1):
            if dane[i] > dane[i+1]:
                temp = dane[i]
                dane[i] = dane[i+1]
                dane[i+1] = temp   
                W = True     
        if W:
            break

def sortowanie_babelkowe_m2(dane):
    for j in range(len(dane)):
        for i in range(len(dane)-1):
            if dane[i] > dane[i+1]:
                temp = dane[i]
                dane[i] = dane[i+1]
                dane[i+1] = temp    
            if i == len(dane)-1:
                dane[i+1] > dane[i+1]
                temp = dane[i+1]
                dane[i+1] = dane[i+1]
                dane[i+1] = temp  

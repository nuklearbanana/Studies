import numpy as np

def indeksy(element,text):
    indexy = []
    for i,j in enumerate(text):
        if j == element:
            indexy.append(i)
    return indexy

def podciag_a(text_a,text_b):
    msubstring = ''
    substring = ''
    maks = 0
    countb = []
    counta = []
    for i in range(len(text_a)):
        if text_a[i] in text_b:
            countb = indeksy(text_a[i],text_b)
            for index in countb:
                if index == len(text_b)-1 or i == len(text_a)-1:
                    continue
                k = i
                substring = ''
                for j in range(index,len(text_b)):
                    if k <= len(text_a)-1:    
                        if text_a[k] == text_b[j]:
                            substring += text_b[j]
                            k += 1
                            if maks < len(substring):
                                msubstring = substring
                                maks = len(msubstring)
                        else:
                            break

    return msubstring


def podciag_b(text_a,text_b):
    matrix = np.zeros([len(text_a)+1,len(text_b)+1])
    track = np.empty([len(text_a)+1,len(text_b)+1],dtype=object)
    substring = ''
    for i in range(len(text_a)-1,-1,-1):
        for j in range(len(text_b)-1,-1,-1):
            if text_a[i] == text_b[j]:
                matrix[i][j] =  matrix[i+1][j+1] + 1
                track[i][j] =  (i+1,j+1)
            else:
                matrix[i][j] = max(matrix[i+1][j],matrix[i][j+1])
                if matrix[i][j] == matrix[i+1][j]:
                    track[i][j] = (i+1,j)
                else:
                    track[i][j] = (i,j+1)
    # Dlugosc = matrix[0][0]
    i,j = 0, 0
    while i < len(text_a) and j < len(text_b):
        if text_a[i] == text_b[j]:
            substring += text_a[i]
            i, j = track[i][j]
        else:
            if matrix[i+1][j] >= matrix[i][j+1]:
                i = track[i][j][0]
            else:
                j = track[i][j][1]

    return f"Najdluzszy podciag: {substring}"
# print(podciag_b('ApqBCrDsEF' , 'tABuCvDEwxFyz'))
print(podciag_b('ovwocsoswfo' , 'ghoswgocowso'))
# print(podciag_b('AXDBCDEF' , 'AOBPCRDEFG'))



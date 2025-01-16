
from L2Sortowania import sortowanie_babelkowe
from L2Sortowania import sortowanie_wybieranie
from L2Sortowania import sortowanie_wstawianie
from L2Sortowania import sortowanie_babelkowe_m1
from L2Sortowania import sortowanie_babelkowe_m2
import time
import random 
import matplotlib.pyplot as plt
import math

def sort_time(n):
    data = [random.randint(0, 100) for _ in range(n)]
    start = time.time() 
    sortowanie_babelkowe(data)
    end = time.time() 
    s1 = end - start
    start = time.time() 
    sortowanie_wybieranie(data)
    end = time.time() 
    s2 = end - start
    start = time.time()  
    sortowanie_wstawianie(data)
    end = time.time()
    s3 = end - start
    time_list = [s1,s2,s3]
    average = (s1 + s2 + s3)/3
    return average,time_list



# Średni i Maksymalny czas przegiegu algorytmów
s1 = []
s2 = []
s3 = []
for i in range(10):
    x = sort_time(2000)
    average = x[0]
    s1.append(x[1][0])
    s2.append(x[1][1])
    s3.append(x[1][2])
print(f"Sredni czas wykonywania algorytmow: {average}")
print(f"Maksymalny czas wykonywania dla sortowania babelkowego: {max(s1)}")
print(f"Maksymalny czas wykonywania dla sortowania przez wybieranie: {max(s2)}")
print(f"Maksymalny czas wykonywania dla sortowania przez wstawianie: {max(s3)}")
#----------------------------------------------------------------------------------
#wykres
a = [10,20,50,100,200,500,1000]
x = []
y = []
for i in a:
    x.append(sort_time(i)[1])
    y.append(sort_time(i)[0])
plt.figure(figsize=(10, 5))
print(x)
print(y)
nazwy = ["sortowanie babelkowe","sortowanie przez wybieranie","sortowanie przez wstawianie",]
for i in range(len(x[0])):
    plt.plot(a, [row[i] for row in x], label=nazwy[i])
plt.plot(a, y, label='Sredni czas')
plt.xlabel('Ilosc danych')
plt.ylabel('Czas')
plt.title('Maksymalny czas sortowania i sredni czas sortowania')
plt.legend()
plt.show()
#----------------------------------------------------------------------------------------------
#Bąbelkowe zestawienie czasów wariantów
def sort_time_2(n):
    data = [random.randint(0, 100) for _ in range(n)]
    start = time.time()  
    sortowanie_babelkowe(data)
    end = time.time()
    s1 = end - start
    start = time.time()  
    sortowanie_babelkowe_m1(data)
    end = time.time()
    s2 = end - start
    start = time.time()  
    sortowanie_babelkowe_m2(data)
    end = time.time()
    s3 = end - start
    time_list = [s1,s2,s3]
    average = (s1 + s2 + s3)/3
    return average,time_list

print(sort_time_2(1000))
#--------------------------------------------------------------------------------------------------
#testy wydajnościowe
ilosci = [10,100,1000]
result = []
for i in ilosci:
    t_sort_bab = sort_time(i)[1][0]
    t_sort_wst = sort_time(i)[1][2]
    t_sort_wyb = sort_time(i)[1][1]
    logn = i * math.log(i)
    #dzielenie przez 0 
    #result.append([logn/t_sort_bab,logn/t_sort_wyb,logn/t_sort_wst])
#print(result)

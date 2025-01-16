
from Z1L3Algorytmy import klienci
from Z1L3Algorytmy import czas_zajecia
import matplotlib.pyplot as plt

def symulacja(urzad,clients):
    #Parametry poczatkowe
    window_time = czas_zajecia(urzad)
    client = clients[0]
    client_time = clients[2]
    client_purpose = clients[1]
    used_clients = []
    A_clients = 0
    B_clients = 0
    C_clients = 0
    E_clients = 0
    condition = not all(element == 0 for element in window_time)
    t = 0
    while condition:
        #zastepowanie klientami 
        for index in range(len(window_time)):
            window = urzad[index]
            if window_time[index] == 0:
                for number in range(len(client)):
                    if (client[number] in used_clients) == False:
                        #okienka A,B,C
                        if client_purpose[number] == window:
                            window_time[index] = client_time[number]
                            used_clients.append(client[number])
                            if window == "A":
                                A_clients += 1
                            elif window == "B":
                                B_clients += 1
                            elif window == "C":
                                C_clients += 1
                            break
                        #okienko E
                        if urzad[index] == 'E':
                            window_time[index] = client_time[number]
                            used_clients.append(client[number])
                            E_clients += 1
                            break
        #upływ czasu
        for i in range(len(window_time)):
            if window_time[i] != 0:
                window_time[i] -= 1
        condition = not all(element == 0 for element in window_time)
        t += 1
    return [t,A_clients,B_clients,C_clients,E_clients]

#Testowanie dla jednej kolejki
u1 = ["A","A","A","B","B","B","C","C","C"]
u2 = ["A","A","B","B","C","C","E","E","E"]
u3 = ["A","B","B","C","C","C","E"]
u = [u1,u2,u3]
n = 30
kolejka = klienci(n)
results = []
for i in range(len(u)):
    results.append(symulacja(u[i],kolejka)[0])
print(f"Test dla jednej kolejki: {results}")
#Testowanie dla 100 kolejek
results_100 = []
for j in range(100):
    kolejka = klienci(n)
    results = []
    for i in range(len(u)):
        results.append(symulacja(u[i],kolejka)[0])
    results_100.append(results)
#Srednia dla 100 kolejek
average = [0] * len(u)
for i in range(len(results_100)):
    for j in range(len(u)):
        average[j] += results_100[i][j]
for i in range(len(average)):
    average[i] = float(average[i]/100)
print(f"Srednia dla 100 kolejek: {average}")

#histogram 
czas_u1 = [x[0] for x in results_100]
czas_u2 = [x[1] for x in results_100]
czas_u3 = [x[2] for x in results_100]

plt.figure(figsize=(10, 6))
plt.hist(czas_u1, bins=20, color='r', alpha=0.7, label='Czas obsługi u1')
plt.hist(czas_u2, bins=20, color='g', alpha=0.7, label='Czas obsługi u2')
plt.hist(czas_u3, bins=20, color='b', alpha=0.7, label='Czas obsługi u3')
plt.xlabel('Czas obsługi')
plt.ylabel('Liczba symulacji')
plt.title('Histogram czasów obsługi')
plt.legend()
plt.grid(True)
plt.show()
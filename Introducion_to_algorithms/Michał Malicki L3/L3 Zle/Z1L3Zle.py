import random
urzad = ['A','A','A','B','B','B','C','C','C','E']
A_clients = 0
B_clients = 0
C_clients = 0
E_clients = 0

def czas_zajecia(urzad):
    time = [random.randint(1,12) for _ in range(len(urzad))]
    return time

def klienci(n):
    klienci = random.sample(range(0,n),n)
    task = [random.choice(["A","B","C"]) for _ in range(n)]
    wage = []
    for i in range(len(task)):
        if task[i] == "A":
            wage.append(random.randint(1,4))
        elif task[i] == "B":
            wage.append(random.randint(5,8))
        else:
            wage.append(random.randint(9,12))
    return [klienci,task,wage]

clients = klienci(40)
client = clients[0]
client_time = clients[2]
client_purpose = clients[1]
window_time = czas_zajecia(urzad)
used_clients = []
t = 0
while window_time != [0,0,0,0,0,0,0,0,0,0]:
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
                    if window_time[-1] == 0:
                        window_time[-1] = client_time[number]
                        used_clients.append(client[number])
                        E_clients += 1
                        break
    #upływ czasu
    for i in range(len(window_time)):
        if window_time[i] != 0:
            window_time[i] -= 1
    t += 1

#print("Dane wyjsciowe: ")
#print(f"Liczba wykonanych iteracji symulacji: {t}")
#print("Liczba klientow przyjetych przez stanowiska: ")
#print(f"A:{A_clients} B:{B_clients} C:{C_clients} E:{E_clients}")

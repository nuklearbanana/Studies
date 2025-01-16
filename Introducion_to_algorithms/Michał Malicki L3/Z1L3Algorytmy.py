import random

class Window:
    def __init__(self,type,time_left):
        self.type = type
        self.time_left = time_left
        self.number = 0
    
    def served(self):
        self.number += 1

class Client:
    def __init__(self,task,time):
        self.task = task
        self.time = time

office = [
    Window('A', random.randint(1,4)),
    Window('A', random.randint(1,4)),
    Window('A', random.randint(1,4)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
    Window('E', random.randint(1,12)),
]

Line = []
for _ in range(40):
    task_type = random.choice(['A','B','C'])
    if task_type == 'A':
        time_amount = random.randint(1,4)
    if task_type == 'B':
        time_amount = random.randint(5,8)
    if task_type == 'C':
        time_amount = random.randint(9,12)
    Line.append(Client(task_type,time_amount))

#Symulacja
iterations = 0
while any(window.time_left > 0 for window in office):
    #Uplyw Czasu
    for window in office:
        if window.time_left > 0:
            window.time_left -= 1
    #Obslugiwanie Kolejki
    for window in office:
        if window.time_left == 0:
            if window.type == "E":
                if Line:
                    client = Line.pop(0)
                    window.time_left = client.time 
                    window.served()
            else:
                for i, client in enumerate(Line):
                    if client.task == window.type:
                        window.time_left = client.time
                        window.served()
                        del Line[i]
    iterations += 1

#print(f"Symulacja zakonczona, liczba iteracji: {iterations}")
#for x,window in enumerate(office):
    #print(f"Okienko numer {x}, Liczba klientow: {window.number}")
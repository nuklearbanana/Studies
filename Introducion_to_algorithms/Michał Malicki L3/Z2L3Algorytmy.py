from Z1L3Algorytmy import Window
from Z1L3Algorytmy import Client
import random
import matplotlib.pyplot as plt

def queue(n):
    Line = []
    for _ in range(n):
        task_type = random.choice(['A','B','C'])
        if task_type == 'A':
            time_amount = random.randint(1,4)
        if task_type == 'B':
            time_amount = random.randint(5,8)
        if task_type == 'C':
            time_amount = random.randint(9,12)
        Line.append(Client(task_type,time_amount))
    return Line

def simulation(office,Line):
    iterations = 0
    while Line or any(window.time_left > 0 for window in office):
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
    return iterations

office_one = [
    Window('A', random.randint(1,4)),
    Window('A', random.randint(1,4)),
    Window('A', random.randint(1,4)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
]

office_two = [
    Window('A', random.randint(1,4)),
    Window('A', random.randint(1,4)),
    Window('E', random.randint(1,12)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('E', random.randint(1,12)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
    Window('E', random.randint(1,12)),
]

office_three = [
    Window('A', random.randint(1,4)),
    Window('E', random.randint(1,12)),
    Window('B', random.randint(5,8)),
    Window('B', random.randint(5,8)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
    Window('C', random.randint(9,12)),
]

Line = queue(30)
#Test
iterations_one = simulation(office_one,Line)
iterations_two = simulation(office_two,Line)
iterations_three = simulation(office_three,Line)

av_one = 0
av_two = 0
av_three = 0
it1 = []
it2 = []
it3 = []
for _ in range(100):
    Line_2 = queue(30)
    iterations_one = simulation(office_one,Line_2.copy())
    it1.append(iterations_one)
    iterations_two = simulation(office_two,Line_2.copy())
    it2.append(iterations_two)
    iterations_three = simulation(office_three,Line_2.copy())
    it3.append(iterations_three)
    av_one += iterations_one
    av_two += iterations_two
    av_three += iterations_three

av_one = av_one/100
av_two = av_two/100
av_three = av_three/100
print(av_one,av_two,av_three)
plt.hist(it1, bins=15, alpha=0.5, label='Office One')
plt.hist(it2, bins=15, alpha=0.5, label='Office Two')
plt.hist(it3, bins=15, alpha=0.5, label='Office Three')
plt.title('Histogramy czasów obsługi dla poszczególnych wersji urzędu')
plt.xlabel('Czas obsługi')
plt.ylabel('Liczebność')
plt.legend()
plt.show()
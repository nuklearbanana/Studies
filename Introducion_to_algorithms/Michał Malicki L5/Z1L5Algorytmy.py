import random
#odleglosc Hamminga
def hamming_a(a,b):
    if len(a) != len(b):
        return "Rozne dlogosci"
    result = 0
    for i in range(len(a)):
        if a[i] != b[i]:
            result += 1
    return result

def sasiaduje(x,y):
    ustawienie_klawiszy = {
        '1': (0, 0), '2': (0, 1), '3': (0, 2), '4': (0, 3), '5': (0, 4), '6': (0, 5), '7': (0, 6), '8': (0, 7), '9': (0, 8), '0': (0, 9),
    'q': (1, 0), 'w': (1, 1), 'e': (1, 2), 'r': (1, 3), 't': (1, 4), 'y': (1, 5), 'u': (1, 6), 'i': (1, 7), 'o': (1, 8), 'p': (1, 9),
    'a': (2, 0), 's': (2, 1), 'd': (2, 2), 'f': (2, 3), 'g': (2, 4), 'h': (2, 5), 'j': (2, 6), 'k': (2, 7), 'l': (2, 8),
    'z': (3, 0), 'x': (3, 1), 'c': (3, 2), 'v': (3, 3), 'b': (3, 4), 'n': (3, 5), 'm': (3, 6)
    }

    a = ustawienie_klawiszy[x]
    b = ustawienie_klawiszy[y]
    if abs(a[0]-b[0]) <= 1 and abs(a[1]-b[1]) <= 1:
        return 1
    else:
        return 0

def hamming_b(a,b):
    if len(a) != len(b):
        return "Rozne dlogosci"
    result = 0
    for i in range(len(a)):
        if a[i] != b[i]:
            if sasiaduje(a[i],b[i]) == 1:
                result += 1
            else:
                result += 2
    return result

def generator(n):
    result = ''
    for i in range(n):
        x = random.randint(97,122)
        result += chr(x)
    return result

def slownik(n):
    slownik = []
    for i in range(n):
        x = random.randint(4,8)
        y = generator(x)
        slownik.append(y)
    return slownik

def return_words(dictionary,prime_word,n = 3):
    if prime_word in dictionary:
        return "OK"
    P = []
    I = []
    for i in range(len(dictionary)):
        if len(dictionary[i]) == len(prime_word):
            P.append(hamming_a(dictionary[i],prime_word))
            I.append(i)
    result = []
    for i in range(n):
        k = P.index(min(P))
        m = P.pop(k) 
        result.append(dictionary[I[i]])
    return result

slowo = "kapusta"

print(return_words(slownik(100),slowo))
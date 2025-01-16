def simplify(text):
    condition = 'ąćęłńóśźżäößüŚĆŹŻ'
    condition_result = 'acelnoszzaobusczz'
    text = list(text)
    for i in range(len(text)):
        if ord(text[i]) > 64 and ord(text[i]) < 91:
            text[i] = chr(ord(text[i]) + 32)
        if text[i] in condition:
            x = condition.index(text[i])
            text[i] = condition_result[x]
        
    text = ''.join(text)
    return text


def frequency(text):
    text = simplify(text)
    package = {}
    freq = {}
    test = 0
    suma = 0
    for i in text:
        if ord(i) > 96 and ord(i) < 123:
            package[i] = text.count(i)
    sorted_package = dict(sorted(package.items()))
    for i in sorted_package:
        suma += sorted_package[i]
    
    for i in sorted_package:
        freq[i] = round((sorted_package[i]/suma)*100,3)
    return freq






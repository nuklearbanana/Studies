from TablicaCzestosciTekstu import simplify

def frequency_shorted(text):
    condition_one = 'zqwsxcdrfvbgthnmjklp'
    condition_two = 'aeyuio'
    samogloski = 0
    spolgloski = 0
    text = simplify(text)
    freq = {}
    suma = 0
    for i in text:

        if i in condition_one:
            suma += 1
            spolgloski += 1
        if i in condition_two:
            suma += 1
            samogloski += 1
        
    freq['spolgloski'] = round((spolgloski/suma)*100,3)
    freq['samogloski'] = round((samogloski/suma)*100,3)
    return freq
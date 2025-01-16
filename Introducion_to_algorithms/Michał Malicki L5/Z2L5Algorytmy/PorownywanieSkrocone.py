from SkroconeTablice import frequency_shorted
from WczytanieDanychZeStrony import tabela_poland
from WczytanieDanychZeStrony import english
from WczytanieDanychZeStrony import tabela_german

tekst = '''Ludzie twardo stąpający po ziemi nie chcą wierzyć, że przed półwieczem wydarzyło się dla Ziemi coś tak niezwykłego. 
Otóż pół wieku temu człowiek postawił nogę na Księżycu. Kiedy wieczorem spoglądamy na rozgwieżdżone niebo z sierpem księżyca, trudno wręcz przypuszczać, że można po nim chodzić.
W naszej wyobraźni tylko legendarny Mistrz Twardowski, zwany polskim Faustem, wylądował tam na kogucie i już pozostał. Poświęcono mu bez mała trzydzieści utworów, filmów, performance'ów, a nawet grę komputerową. 
Na Księżyc latali bohaterowie książek i filmów science fiction. O próbie kolonizacji ziemskiego satelity traktuje trylogia Jerzego Żuławskiego „Na srebrnym globie” sprzed ponad stu lat. 
Po więcej niż półwieczu jego stryjeczny wnuk, Andrzej Żuławski nakręcił film pod tym samym tytułem. A niespełna dwadzieścia lat wcześniej wielki krok dla ludzkości zrobił Neil Armstrong, stawiając stopę na Księżycu. 
Trzej astronauci polecieli statkiem Apollo 11 w roku 1969, by spełnić marzenie ludzkości. 
Znamy wszak wszyscy minitrylogię „Wokół Księżyca” pioniera prozy fantastycznonaukowej,  Juliusza Verne'a. Dokładnie w stulecie pierwodruku powieści marzenie Ziemian się ziściło. 
Kilkadziesiąt lat po Vernie francuski reżyser, Georges Méliès przedstawił wyobrażenie Księżyca w filmie „Podróż na Księżyc”. Ale wtedy taka podróż była jeszcze mirażem i mrzonką.
Hołd odważnym kosmonautom oddali twórcy filmu „Apollo 13”, w którym usłyszeliśmy słynny tekst: „Houston, mamy problem!”. Armstrong doczekał się filmowej biografii w filmie „Pierwszy człowiek”. 
„Ukryte działania” to z kolei obraz o genialnych czarnoskórych matematyczkach w NASA. Pokazuje kobiety, które swymi obliczeniami umożliwiły pierwsze loty w kosmos (a. Kosmos), a swoją wiedzą i postawą zrobiły wiele dla równouprawnienia płciowego i rasowego w USA.
Zatem reasumując: kiedy para młodych mieszkańców Ziemi siedzi na rozgrzanej letnim słońcem ziemi i patrzy sobie w oczy i na błyszczący srebrny księżyc, niech w swych źrenicach szuka liczb parzystych i niewymiernych oraz matematycznych działań różniczkowych. 
A dzięki temu być może w podróż poślubną polecą na Księżyc.'''

tekst2 = '''Skąd to się bierze? Nie ma(m) prostej odpowiedzi, tylko kilka refleksji. 
Pierwsza rzecz to wszechobecny lęk, także o dziecko. Napędzany medialnym bajdurzeniem i rosnącymi nierównościami społecznymi. 
Znajdujący wyraz w montowaniu wszędzie kamer monitoringu, grodzeniu przestrzeni miast i wygradzaniu przestrzeni życiowej uprzywilejowanych 
klas społecznych. Wsiadasz w samochód na parkingu podziemnym, uczysz się w prywatnej szkole, siedzisz w starbaksie i na fejsie, serfujesz na
Rodos i spotykasz tylko ludzi takich jak ty. Z tym wiąże się kolejna sprawa, czyli utrata oswojonych przestrzeni publicznych. 
Nikt nie będzie się już przecież bawił na łączce między blokami, bo (1) teraz jest tam parking, (2) komputer jest bardziej rozrywkowym 
towarzyszem, (3) ogrodzili ją ci z nowych bloków, (4) z kim niby miałbym się tam bawić (5) i w co? Rozrywkowość, a w zasadzie 
samowystarczalność świata wirtualnego to następny problem. Coraz młodsze osoby, coraz atrakcyjniejsze bodźce, i moim skromnym nauczycielskim
zdaniem, coraz bardziej wypaczone zdolności poznawcze. I dwie ostatnie kwestie, tj. budowanie kariery od dziecka i umiastowienie wsi. 
Rolników już prawie nie ma, zostali ew. biznesmeni. Są za to dacze i domy pod miastem, z rządkiem tuj i podgrzewaną podłogą, z wielkim 
płotem i równiutkim trawnikiem, który ładnie wygląda zza okna. A na działkach zaraz będą apartamentowce.'''

tekst3 = '''The deadliest virus in modern history, perhaps of all time, was the 1918 Spanish Flu. It killed about 20 to 50 million people worldwide, perhaps more. The total death toll is unknown because medical records were not kept in many areas.

The pandemic hit during World War I and devastated military troops. In the United States, for instance, more servicemen were killed from the flu than from the war itself. The Spanish flu was fatal to a higher proportion of young adults than most flu viruses.

The pandemic started mildly, in the spring of 1918, but was followed by a much more severe wave in the fall of 1918. The war likely contributed to the devastating mortality numbers, as large outbreaks occurred in military forces living in close quarters. Poor nutrition and the unsanitary conditions of war camps had an effect.

A third wave occurred in the winter and spring of 1919, and a fourth, smaller wave occurred in a few areas in spring 1920. Initial symptoms of the flu were typical: sore throat, headache, and fever. The flu often progressed rapidly to cause severe pneumonia and sometimes hemorrhage in the lungs and mucus membranes. A characteristic feature of severe cases of the Spanish Flu was heliotrope cyanosis, where the patient’s face turned blue from lack of oxygen in the cells. Death usually followed within hours or days.

Modern medicine such as vaccines, antivirals, and antibiotics for secondary infections were not available at that time, so medical personnel couldn’t do much more than try to relieve symptoms.'''

def shorted(dictionary):
    condition_one = 'zqwsxcdrfvbgthnmjklp'
    condition_two = 'aeyuio'
    spolgloski = 0
    samogloski = 0
    freq = {}
    for i in dictionary:
        if i in condition_one:
            spolgloski += float(dictionary[i])
        if i in condition_two:
            samogloski += float(dictionary[i])
    #freq['spolgloski'] = round((spolgloski/suma)*100,3)
    #freq['samogloski'] = round((samogloski/suma)*100,3)
    freq['spolgloski'] = round(spolgloski,5)
    freq['samogloski'] = round(samogloski,5)
    return freq

def cost(value, language):
    suma = 0
    for i in language:
        suma += round(abs(language[i] - value[i]),2)
    return [suma]


value = frequency_shorted(tekst3)
value_german = shorted(tabela_german)
value_poland = shorted(tabela_poland)
value_english = shorted(english)

print(value_german, value_english, value_poland)

result = []
result.append([cost(value,value_poland),'polski'])
result.append([cost(value,value_german),'niemiecki'])
result.append([cost(value,value_english),'angielski'])

print(f"najbardziej podobnym językiem jest {min(result)[1]}")
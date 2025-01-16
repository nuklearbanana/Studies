from TablicaCzestosciTekstu import frequency
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

def cost(text,to_text):
    value = 0
    for i in range(len(text)):
        value += abs(text[i] - to_text[i])
    return value

freq = frequency(tekst)
values = []
values_poland = []
values_english = []
values_german = []
for i in freq:
    values.append(float(freq[i]))
    values_poland.append(float(tabela_poland[i]))
    values_english.append(float(english[i]))
    values_german.append(float(tabela_german[i]))

result = [cost(values_german,values),cost(values_poland,values),cost(values_english,values)]
if result.index(min(result)) == 0:
    print("Tekst najbardziej podobny do jezyka niemieckiego")
elif result.index(min(result)) == 1:
    print("Tekst najbardziej podobny do jezyka polskiego")
elif result.index(min(result)) == 2:
    print("Tekst najbardziej podobny do jezyka angielskiego")



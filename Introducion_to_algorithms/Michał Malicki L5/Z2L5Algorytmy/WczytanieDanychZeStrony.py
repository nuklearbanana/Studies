import requests
from bs4 import BeautifulSoup

url = 'https://en.wikipedia.org/wiki/Letter_frequency'
page = requests.get(url)
html = page.text
soup = BeautifulSoup(html, "html.parser")
tables = soup.find_all("table")
table = tables[3]
dane = []
for row in table.find_all("tr"):
    windows = row.find_all(['th','td'])
    row_data = [window.get_text(strip=True) for window in windows]
    dane.append(row_data)

poland = {}
english = {}
german = {}

for row in range(1, len(dane)):
    if dane[row][9] != '0' and dane[row][9][0] != '~' and dane[row][9][1] != '[':
        poland[dane[row][0]] = dane[row][9]
    if dane[row][1] != '0' and dane[row][1][0] != '~' and dane[row][1][1] != '[':
        english[dane[row][0]] = dane[row][1][0:5]
    if dane[row][3] != '0' and dane[row][3][0] != '~' and dane[row][3][1] != '[':
        german[dane[row][0]] = dane[row][3]

condition = 'ąćęłńóśźżäößü'
condition_result = 'acelnoszzaobu'

tabela_poland = {}
tabela_german = {}    

for i in poland:
    if i in condition:
        index = condition.index(i)
        x = condition_result[index]
        tabela_poland[x] = round(float(poland[i][0:5]) + float(poland[x][0:5]),3)
    else:
        tabela_poland[i] = poland[i][0:5]

for i in german:
    if i in condition:
        index = condition.index(i)
        x = condition_result[index]
        tabela_german[x] = round(float(german[i][0:5]) + float(german[x][0:5]),3)
    else:
        tabela_german[i] = german[i][0:5]

# Tabele dla angielskiego, niemieckiego i polskiego
# print(english)
# print(tabela_german)
# print(tabela_poland)

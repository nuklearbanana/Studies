#Zadanie 1

dane = c(171,200,168,213,226,222)
zaobserwowane = sum(dane)
expected = numeric(0)
n = length(dane)

#a 
for (i in 1:n)
{
  expected = c(expected,(zaobserwowane/6))
}

#b chikwadrat
ck = sum(((dane - expected)^2) / expected)

#c
p = 1 - pchisq(ck,n-1)

#d
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}

#e
p = chisq.test(dane)
p = p$p.value 


#Zadanie 2
dane = matrix(c(200,150,300,350),2 )
zaobserwowane = (sum(dane))
n = length(dane)
#a
wiersze = rowSums(dane)
kolumny = colSums(dane)
expected = outer(wiersze, kolumny)/zaobserwowane
#b
ck =  sum(((dane - expected)^2) / expected)
#c
p = 1 - pchisq(ck,n-1)
#d
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#e
p = chisq.test(dane)
p = p$p.value 
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#f
p = fisher.test(dane)
p = p$p.value
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#Zadanie 3

library(readxl)
dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")
#a
tablica = table(dane$Dzielnica, dane$Pokoje)

#b 
dane$Zmienna = ifelse(dane$Pokoje >= 4, 4, dane$Pokoje)

#c
p = chisq.test(tablica)
p = p$p.value 
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#Zadanie 4
library(readxl)
dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")

#a
dane$Zmienna = ifelse((dane$Cena/dane$Metraz) > 6000, 'TAK', 'NIE')
#b
tablica = table(dane$Dzielnica,dane$Zmienna)
p = chisq.test(tablica)
p = p$p.value 
if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#Zadanie 5
library(readxl)
dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")

#a
p = shapiro.test(dane$Cena / dane$Metraz)
p = p$p.value

g = density(dane$Cena / dane$Metraz)
plot(g,main = "Estymator gęstości cena/m2")

if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}

#b
metraz = dane$Metraz[dane$Dzielnica == "Srodmiescie"]
p =  shapiro.test(metraz)
p = p$p.value
g = density(metraz)
plot(g,main = "Estymator gęstości metraz")

if (p < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#Zadanie 6
#a
proba = rexp(1000,1)
#b
pn = shapiro.test(proba)
pn = pn$p.value
if (pn < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
pw = ks.test(proba, "pexp",1)
pw = pw$p.value
if (pw < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
#c
proba = rgamma(1000,100,1)

#d
pn = shapiro.test(proba)
pn = pn$p.value
if (pn < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}
pg = ks.test(proba, "pgamma",100,1)
pg = pg$p.value
if (pg < 0.05) {
  print("Odrzucamy hipotezę") 
} else {
  print("Nie ma podstaw do odrzucenia hipotezy")
}






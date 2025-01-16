#Zadanie 1

average = 109  # Średnia próbkowa
mu = 105  # hipoteza zerowa
var = 225 #wariancja
s = sqrt(var)  # Odchylenie standardowe próbkowe
n = 100  # Liczebność próby

#i
#Test Z
Z = (average - mu)/(s/sqrt(n))
pz = 2 * (1 - pnorm(abs(Z)))  # Wartość p 
wkz_5 = qnorm(0.975)
wkz_1 = qnorm(0.995)
wkz_01 = qnorm(0.9995)

#Test Studenta
t = (average - mu) / (s / sqrt(n))
df = n - 1  # Stopnie swobody
pt = 2 * (1 - pt(abs(t), df))  # Wartość p 
wkt_5 = qt(0.975, df)  
wkt_1 = qt(0.995, df)  
wkt_01 = qt(0.9995, df)  

#ii
if (wkz_5 < abs(Z))
{
  if(wkz_1 < abs(Z))
  {
    if (wkz_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}

if (wkt_5 < abs(Z))
{
  if(wkt_1 < abs(Z))
  {
    if (wkt_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}

#Zadanie 2

library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

average = mean(dane$Wzrost)
mu = 168
n = length(dane$Wzrost)
s = sd(dane$Wzrost)

#Test Z
Z = (average - mu)/(s/sqrt(n))
pz = 2 * (1 - pnorm(abs(Z)))  # Wartość p 
wkz_5 = qnorm(0.975)
wkz_1 = qnorm(0.995)
wkz_01 = qnorm(0.9995)

#Test Studenta
t = (average - mu) / (s / sqrt(n))
df = n - 1  # Stopnie swobody
pt = 2 * (1 - pt(abs(t), df))  # Wartość p 
wkt_5 = qt(0.975, df)  
wkt_1 = qt(0.995, df)  
wkt_01 = qt(0.9995, df)  

#Funkcja t.test
test_result = t.test(dane$Wzrost,alternative = "two.sided",mu = mu)

#ii
#Test Z
if (wkz_5 < abs(Z))
{
  if(wkz_1 < abs(Z))
  {
    if (wkz_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Test Studenta
if (wkt_5 < abs(Z))
{
  if(wkt_1 < abs(Z))
  {
    if (wkt_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Funkcja t.test

if (test_result$p.value < 0.05)
{
  if(test_result$p.value < 0.01)
  {
    if (test_result$p.value < 0.001)
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}


#Zadanie 3

library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

average = mean(dane$Wzrost[dane$plec == 0])
n = length(dane$Wzrost[dane$plec == 0])
mu = 172
s = sd(dane$Wzrost[dane$plec == 0])

#i
#Test Z
Z = (average - mu)/(s/sqrt(n))
pz = 2 * (1 - pnorm(abs(Z)))  # Wartość p 
wkz_5 = qnorm(0.975)
wkz_1 = qnorm(0.995)
wkz_01 = qnorm(0.9995)

#Test Studenta
t = (average - mu) / (s / sqrt(n))
df = n - 1  # Stopnie swobody
pt = 2 * (1 - pt(abs(t), df))  # Wartość p 
wkt_5 = qt(0.975, df)  
wkt_1 = qt(0.995, df)  
wkt_01 = qt(0.9995, df)  

#Funkcja t.test
test_result = t.test(dane$Wzrost[dane$plec == 0],alternative = "two.sided",mu = mu)

#ii
#Test Z
if (wkz_5 < abs(Z))
{
  if(wkz_1 < abs(Z))
  {
    if (wkz_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Test Studenta
if (wkt_5 < abs(Z))
{
  if(wkt_1 < abs(Z))
  {
    if (wkt_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Funkcja t.test

if (test_result$p.value < 0.05)
{
  if(test_result$p.value < 0.01)
  {
    if (test_result$p.value < 0.001)
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}

#Zadanie 4 


library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

average = mean(dane$Waga_po -  dane$Waga_przed)
mu = 2
n = length(dane$Waga_po)
s = sd(dane$Waga_po -  dane$Waga_przed)

#i
#Test Z
Z = (average - mu)/(s/sqrt(n))
pz = 2 * (1 - pnorm(abs(Z)))  # Wartość p 
wkz_5 = qnorm(0.975)
wkz_1 = qnorm(0.995)
wkz_01 = qnorm(0.9995)

#Test Studenta
t = (average - mu) / (s / sqrt(n))
df = n - 1  # Stopnie swobody
pt = 2 * (1 - pt(abs(t), df))  # Wartość p 
wkt_5 = qt(0.975, df)  
wkt_1 = qt(0.995, df)  
wkt_01 = qt(0.9995, df)  

#Funkcja t.test
test_result = t.test(dane$Waga_po -  dane$Waga_przed,alternative = "two.sided",mu = mu)

#ii
#Test Z
if (wkz_5 < abs(Z))
{
  if(wkz_1 < abs(Z))
  {
    if (wkz_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Test Studenta
if (wkt_5 < abs(Z))
{
  if(wkt_1 < abs(Z))
  {
    if (wkt_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Funkcja t.test

if (test_result$p.value < 0.05)
{
  if(test_result$p.value < 0.01)
  {
    if (test_result$p.value < 0.001)
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}

#Zadanie 5
library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

average = mean(dane$Waga_po[dane$plec == 0] -  dane$Waga_przed[dane$plec == 0])
mu = 4
n = length(dane$Waga_po[dane$plec == 0])
s = sd(dane$Waga_po[dane$plec == 0] -  dane$Waga_przed[dane$plec == 0])


#i
#Test Z
Z = (average - mu)/(s/sqrt(n))
pz = 2 * (1 - pnorm(abs(Z)))  # Wartość p 
wkz_5 = qnorm(0.975)
wkz_1 = qnorm(0.995)
wkz_01 = qnorm(0.9995)

#Test Studenta
t = (average - mu) / (s / sqrt(n))
df = n - 1  # Stopnie swobody
pt = 2 * (1 - pt(abs(t), df))  # Wartość p 
wkt_5 = qt(0.975, df)  
wkt_1 = qt(0.995, df)  
wkt_01 = qt(0.9995, df)  

#Funkcja t.test
test_result = t.test(dane$Waga_po[dane$plec == 0] -  dane$Waga_przed[dane$plec == 0],alternative = "two.sided",mu = mu)

#ii
#Test Z
if (wkz_5 < abs(Z))
{
  if(wkz_1 < abs(Z))
  {
    if (wkz_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Test Studenta
if (wkt_5 < abs(Z))
{
  if(wkt_1 < abs(Z))
  {
    if (wkt_01 < abs(Z))
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}
#Funkcja t.test

if (test_result$p.value < 0.05)
{
  if(test_result$p.value < 0.01)
  {
    if (test_result$p.value < 0.001)
    {
      print("Bardzo mocne dowody przeciwko H0")
    }
    else
    {
      print("Mocne dowody przeciwko H0")
    }
  }
  else
  {
    print("Dowody przeciwko H0")
  }
} else {
  print("Brak dowodow przeciwko H0")
}

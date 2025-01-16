#1
n = 100
srednia= 109
var = 225

#a
#i
p = 30/n
WK1 = qnorm(1 - 0.05 / 2) #wartość krytyczna dla rozkładu normalnego 
EBS2 =WK1 * sqrt(p * (1 - p) / n) #margines błędu
przedzial3 = c(p - EBS2, p + EBS2) #przedział ufności
#ii
p = 30/n
WK2 = qnorm(1 - 0.01 / 2) #wartość krytyczna dla rozkładu normalnego 
EBS2 =WK2 * sqrt(p * (1 - p) / n) #margines błędu
przedzial4 = c(p - EBS2, p + EBS2) #przedział ufności

#b
EBS = sqrt(var)/sqrt(n) # estymator bledu standardowego
#i  95%
Z1 = qnorm(0.975) #kwantyl
R1 = EBS * Z1 #promien przedzialu
przedzial1 = c(srednia-R1,srednia+R1)
#ii

Z2 = qnorm(0.995) #kwantyl
R2 = EBS * Z2 #promien przedzialu
przedzial2 = c(srednia-R2,srednia+R2)

#c
#i
s = sqrt(var)
df = n - 1
EBS = qt(1 - 0.05 / 2, df)
R1 = EBS * s / sqrt(n)
przedzial5 = c(srednia - R1, srednia + R2)
#ii
s = sqrt(var)
df = n - 1
EBS = qt(1 - 0.01 / 2, df)
R2 = EBS * s / sqrt(n)
przedzial6 = c(srednia - R2, srednia + R2)


library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

#2
av_wzrost = mean(dane$Wzrost)
s = sd(dane$Wzrost)
n = 100
#a
E = qnorm(1 - 0.1 / 2)
R = E * s / sqrt(n)
przedzial7 <- c(av_wzrost - R, av_wzrost + R)
#b
E = qt(1 - 0.1 / 2, n - 1)
R = E * s / sqrt(n)
przedzial8 = c(av_wzrost - R, av_wzrost + R)
#c
probki = numeric(1000)
for ( i in 1:1000 )
{
  probka = sample(dane$Wzrost,replace = TRUE,size = 1000)
  probki[i] = mean(probka)
}
przedzial9 = quantile(probki, c(0.1/2, 1-0.1/2))
  
#3
av_wzrost_k = numeric(0)
wzrost_k = numeric(0)
for (i in 1:length(dane$plec))
{
    if (dane$plec[i] == 1)
    {
      av_wzrost_k = c(av_wzrost_k,dane$Wzrost[i])
      wzrost_k = c(wzrost_k,dane$Wzrost[i])
    }
}
av_wzrost_k = mean(av_wzrost_k)
s = sd(wzrost_k)
n = length(wzrost_k)
#a
E = qnorm(1 - 0.02 / 2)
R = E * s / sqrt(n)
przedzial10 <- c(av_wzrost_k - R, av_wzrost_k + R)
#b
E = qt(1 - 0.02 / 2, n - 1)
R = E * s / sqrt(n)
przedzial11 = c(av_wzrost_k - R, av_wzrost_k + R)
#c
probki = numeric(1000)
for ( i in 1:1000 )
{
  probka = sample(wzrost_k,replace = TRUE,size = 1000)
  probki[i] = mean(probka)
}
przedzial12 = quantile(probki, c(0.02/2, 1-0.02/2))

#4
proporcja = sum(dane$Wzrost > 168) / 100
#a
E = qnorm(1 - 0.06 / 2)
R = sqrt(proporcja * (1 - proporcja) / 100)
przedzial13 = c(proporcja - E * R, proporcja + E * R)
#b
probka = numeric(0)
for ( i in 1:length(dane$Wzrost))
{
  print(i)
  if (dane$Wzrost[i] > 168)
  {
    probka = c(probka,dane$Wzrost[i])
  }
}
average = numeric(0)
for ( i in 1:1000 )
{
  element = sample(probka,replace = TRUE,size = 1000)
  average = c(average,mean(element))
}

przedzial14 = quantile(average, c(0.06/2, 1-0.06/2))

#5
wzrost_k = numeric(0)
for (i in 1:length(dane$plec))
{
  if (dane$plec[i] == 1)
  {
    wzrost_k = c(wzrost_k,dane$Wzrost[i])
  }
}
proporcja = sum(dane$Wzrost > 168) / length(wzrost_k)
#a 
E = qnorm(1 - 0.04 / 2)
R = sqrt(proporcja * (1 - proporcja) / 100)
przedzial15 = c(proporcja - E * R, proporcja + E * R)

#b 
probka = numeric(0)
for ( i in 1:length(wzrost_k))
{
  print(i)
  if (wzrost_k[i] > 168)
  {
    probka = c(probka,wzrost_k[i])
  }
}
average = numeric(0)
for ( i in 1:1000 )
{
  element = sample(probka,replace = TRUE,size = 1000)
  average = c(average,mean(element))
}

przedzial16 = quantile(average, c(0.04/2, 1-0.04/2))



#1
a1 = runif(5000)
#Wykresy dla Jednostajnego
hist(a1,breaks = 100,main = "Histogram Rozkładu Jednsotajnego")
x = density(a1)
plot(x,main = "Estymator Jądrowy",xlab = "Wartość",ylab = "Gęstość")
#Wykresy dla normalnego
a2 = rnorm(3000,100,15)
hist(a2,breaks = 100,main = "Histogram Rozkładu Normalnego")
y = density(a2)
plot(y,main = "Estymator Jądrowy Rozkładu Normalnego",xlab = "Wartość",ylab = "Gęstość")

#2 
#a
b1 = runif(600)
rzuty = floor(b1*6)+1
var_rzuty = var(rzuty)
srednia_rzuty = mean(rzuty)
czestosc_rzuty = table(rzuty)
ramka_danych = as.data.frame(czestosc_rzuty)
var_czestosci = var(czestosc_rzuty)
#b
b2 = sample(1:6,600, replace = TRUE)

#3
k = c(0,1,2,3)
P = c(0.3,0.4,0.2,0.1)
c1 = sample(k,1000, replace = TRUE,prob = P)

#4 
#a
d1 = rbinom(100,10,0.3)
# każda liczba, liczbą sukcesów w jednej iteracji
#b
d2 = rgeom(50,0.4)
#każda liczba, liczbą prób do uzyskania pierwszego sukcesu

#c

mi = 3
x = 0
p = exp(-mi)
u = runif(1)
s = p

realizations = numeric(0)
while(length(realizations)<= 50)
{
  while(s<u)
  {
    x = x + 1
    p = (mi *p) / x
    s = s + p
  }
  realizations = c(realizations,x)
  x = 0
  p = exp(-mi)
  u = runif(1)
  s = p
}
print(realizations)

#5
#a
result = numeric(0)
n = 1
while(n<200)
{
  u = runif(1)
  g_inv = sqrt(4*u)
  x = g_inv
  n = n + 1
  result = c(result,x)
}
print(result)


#b
v = 0
result = numeric(n)
while (v < 200) {
  x = runif(1, min = 0, max = 2)
  u = runif(1)
  if (u <= 0.5*x / (2 * 1)) {
    result[v + 1] <- x
    v = v + 1
  }
}
print(result)


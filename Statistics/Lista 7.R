#1
#a
sigma = sqrt(144)
mi = 170
a1 = (164 - mi)/sigma
pi = pnorm(a1) #i

a2 = (188 - mi)/sigma
pii = 1 - pnorm(a2) #ii

a3 = (185 - mi)/sigma
a4 = (158 - mi)/sigma
piii = pnorm(a3) - pnorm(a4) #iii

#b
k = qnorm(1 - 0.15,mi,sigma)

#2
#i
U1 = runif(10000)
U2 = runif(10000)
Z = cos(2*pi*U1) * sqrt(-2*log(U2))
#ii
estymator = density(Z)
porownanie1 = seq(min(Z), max(Z), length.out = 1000)
porownanie2 = dnorm(porownanie1,0,1)
plot(estymator, main = "Porównanie ","Zmienna Z","Gęstość", col = "blue")
lines(porownanie1, porownanie2, col = "red")

#iii
Y = 100 + 15*Z
estymatorY = density(Y)
porownanie3 = seq(min(Y), max(Y), length.out = 1000)
porownanie4 = dnorm(porownanie3,100,sqrt(15))
plot(estymatorY,"Porównanie ","Zmienna Y","Gęstość", col = "blue")
lines(porownanie3, porownanie4, col = "red")

#3
#i
X = rnorm(2000,170,12) 
Z = (X - 170)/12
dZ = density(Z)
p1a = seq(min(Z), max(Z), length.out = 2000)
p1b = dnorm(p1a)

plot(dZ, main = "Porównanie ","Zmienna Z n = 2000","Gęstość", col = "blue")
lines(p1a, p1b, col = "red")
#ii
X = rnorm(500,170,12) 
Z = (X - 170)/12
dZ = density(Z)
p2a = seq(min(Z), max(Z), length.out = 500)
p2b = dnorm(p2a)

plot(dZ, main = "Porównanie ","Zmienna Z n = 500","Gęstość", col = "blue")
lines(p2a, p2b, col = "red")
#iii
X = rnorm(100,170,12) 
Z = (X - 170)/12
dZ = density(Z)
p3a = seq(min(Z), max(Z), length.out = 100)
p3b = dnorm(p1a)

plot(dZ, main = "Porównanie ","Zmienna Z n = 100","Gęstość", col = "blue")
lines(p3a, p3b, col = "red")

#4
n1 = 1
n2 = 20
n3 = 200
lambda = 0.5

S1 = rgamma(1000,n1,lambda)
E1 =  2*n1
SG1 = 2*n1^lambda
Z1 = (S1 - E1)/SG1
WZ1 = density(Z1)
P1 = seq(min(Z1),max(Z1),length.out = 1000)
plot(WZ1)
lines(P1,dnorm(P1),col="red")

S2 = rgamma(1000,n2,lambda)
E2 = 2*n2
SG2 = 2*n2^lambda
Z2 = (S2 - E2)/SG2
WZ2 = density(Z2)
P2 = seq(min(Z2),max(Z2),length.out = 1000)
plot(WZ2)
lines(P2,dnorm(P2),col="red")

S3 = rgamma(1000,n3,lambda)
E3 = 2*n3
SG3 = 2*n3^lambda
Z3 = (S3 - E3)/SG3
WZ3 = density(Z3)
P3 = seq(min(Z3),max(Z3),length.out = 1000)
plot(WZ3)
lines(P3,dnorm(P3),col="red")

#5 
wektorn = c(30,1000)
wektorp = c(0.5,0.5,0.1,0.05)
i = 1
for (p in wektorp)
{
  if (i%%2 == 0)
  {
    n = wektorn[2]
  }
  else
  {
    n = wektorn[1]
  }
  i = i+1
  
  x = rbinom(10000,n,p)
  plot(density(x),paste("Wykres dla n = ",n," p = ",p))
  sd = sqrt(n*p*(1-p))
  av = n*p
  lines(0:n,dnorm(0:n,av,sd),col = "red")
}

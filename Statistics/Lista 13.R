#Zadanie 1
analiza = c(28, 26, 23, 18, 14, 12)
algebra = c(25, 27, 20, 24, 16, 13)

#a

#Pearson
rp = cor(analiza, algebra, method = "pearson")

#Spearman
rs = cor(analiza, algebra, method = "spearman")

#Kendall:
rk = cor(analiza,algebra, method = "kendall")

#b
prp = cor.test(analiza,algebra, method = "pearson")
prp = prp$p.value

prs = cor.test(analiza, algebra, method = "spearman")
prs = prs$p.value

prk = cor.test(analiza, algebra, method = "kendall")
prk = prk$p.value

if (prp  < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

if (prs < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

if ( prk < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}
#Zadanie 2

#a

X = rnorm(100)
Y = rnorm(100)

#b
# Niech ρ oznacza współczynnik korelacji między X a Y w całej populacji.
# Testujemy H0 : ρ = 0 kontra H1 : ρ != 0.

prp = cor.test(X, Y, method = "pearson")
prp = prp$p.value

prs = cor.test(X, Y, method = "spearman")
prs = prs$p.value

prk = cor.test(X, Y, method = "kendall")
prk = prk$p.value

#c
N = 1000
n = 100
# wyznaczanie współczynników korelacji oraz wartości bezwzględnych
kp = cor(X, Y, method="pearson")
ks = cor(X, Y, method="spearman")
kk = cor(X, Y, method="kendall")
kpa = abs(kp)
ksa = abs(ks)
kka = abs(kk)
cor.test(X, Y, method="pearson")
cor.test(X, Y, method="spearman")
cor.test(X, Y, method="kendall")
# liczba symulacji przy której bezwzględna wartość współczynnika korelacji
# przekracza bezwzględną wartość współczynnika dla próby
np = 0
ns = 0
nk = 0
# testy permutacyjne
for (i in 1:N){
  losowa_permutacja = sample(Y, n) # domyślnie replace=FALSE
  kp1 = cor(X, losowa_permutacja,method="pearson")
  ks1 = cor(X, losowa_permutacja,method="spearman")
  kk1 = cor(X, losowa_permutacja,method="kendall")
  if (abs(kp1)>=kpa) {np = np+1}
  if (abs(ks1)>=ksa) {ns = ns+1}
  if (abs(kk1)>=kka) {nk = nk+1}
}
(pp = np/N)
(ps = ns/N)
(pk = nk/N)

#d 
# metoda Bootstrap
ns<-1000
alpha<-0.05
kpb<-array(0,dim=ns)
ksb<-array(0,dim=ns)
kkb<-array(0,dim=ns)
xp<-array(0,dim=n)
yp<-array(0,dim=n)
for (i in 1:ns){
  # boot lista wybranych par - ze zwracaniem
  boot<-sample(1:n,n,replace=TRUE)
  for (j in 1:n){
    xp[j]<-X[boot[j]]
    yp[j]<-Y[boot[j]]
  }
  kpb[i]<-cor(xp,yp,method="pearson")
  ksb[i]<-cor(xp,yp,method="spearman")
  kkb[i]<-cor(xp,yp,method="kendall")
}
kpb<-sort(kpb)
ksb<-sort(ksb)
kkb<-sort(kkb)
# indeksy dla dolnej i górnej granicy
ind_d<-ns*alpha/2+1
ind_g<-ns*(1-alpha/2)
# przedział ufności dla współczynnika Pearsona
(pup_d<-kpb[ind_d])
(pup_g<-kpb[ind_g])
# przedział ufności dla współczynnika Spearmana
(pus_d<-ksb[ind_d])
(pus_g<-ksb[ind_g])
# przedział ufności dla współczynnika Kendalla
(puk_d<-kkb[ind_d])
(puk_g<-kkb[ind_g])

#e
plot(X, Y, xlab = "X", ylab = "Y", title("X i Y"))

#Zadanie 3

#a
V = 0.2 * X + sqrt(0.96) * Y

N = 1000
n = 100
# wyznaczanie współczynników korelacji oraz wartości bezwzględnych
kp = cor(X, V, method="pearson")
ks = cor(X, V, method="spearman")
kk = cor(X, V, method="kendall")
kpa = abs(kp)
ksa = abs(ks)
kka = abs(kk)
cor.test(X, V, method="pearson")
cor.test(X, V, method="spearman")
cor.test(X, V, method="kendall")
# liczba symulacji przy której bezwzględna wartość współczynnika korelacji
# przekracza bezwzględną wartość współczynnika dla próby
np = 0
ns = 0
nk = 0
# testy permutacyjne
for (i in 1:N){
  losowa_permutacja = sample(V, n) # domyślnie replace=FALSE
  kp1 = cor(X, losowa_permutacja,method="pearson")
  ks1 = cor(X, losowa_permutacja,method="spearman")
  kk1 = cor(X, losowa_permutacja,method="kendall")
  if (abs(kp1)>=kpa) {np = np+1}
  if (abs(ks1)>=ksa) {ns = ns+1}
  if (abs(kk1)>=kka) {nk = nk+1}
}
(pp = np/N)
(ps = ns/N)
(pk = nk/N)

# metoda Bootstrap
ns<-1000
alpha<-0.05
kpb<-array(0,dim=ns)
ksb<-array(0,dim=ns)
kkb<-array(0,dim=ns)
xp<-array(0,dim=n)
vp<-array(0,dim=n)
for (i in 1:ns){
  # boot lista wybranych par - ze zwracaniem
  boot<-sample(1:n,n,replace=TRUE)
  for (j in 1:n){
    xp[j]<-X[boot[j]]
    vp[j]<-V[boot[j]]
  }
  kpb[i]<-cor(xp,yp,method="pearson")
  ksb[i]<-cor(xp,yp,method="spearman")
  kkb[i]<-cor(xp,yp,method="kendall")
}
kpb<-sort(kpb)
ksb<-sort(ksb)
kkb<-sort(kkb)
# indeksy dla dolnej i górnej granicy
ind_d<-ns*alpha/2+1
ind_g<-ns*(1-alpha/2)
# przedział ufności dla współczynnika Pearsona
(pup_d<-kpb[ind_d])
(pup_g<-kpb[ind_g])
# przedział ufności dla współczynnika Spearmana
(pus_d<-ksb[ind_d])
(pus_g<-ksb[ind_g])
# przedział ufności dla współczynnika Kendalla
(puk_d<-kkb[ind_d])
(puk_g<-kkb[ind_g])

#b

prp = cor.test(X, V, method = "pearson")
prp = prp$p.value

prs = cor.test(X, V, method = "spearman")
prs = prs$p.value

prk = cor.test(X, V, method = "kendall")
prk = prk$p.value

plot(X, V, xlab = "X", ylab = "V", title("X i V"))

#Zadanie 4

#a
X = rnorm(100)
Y = rnorm(100)
V = 0.7 * X + Y * sqrt(1 - 0.7^2)

#b
H = 170 + 12 * X
W = 65 + 10 * V

H_average = mean(H)
H_sd = sd(H)

W_average = mean(W)
W_sd = sd(W)

rp = cor(H, W, method = "pearson")
rs = cor(H, W, method = "spearman")
rk = cor(H, W, method = "kendall")

#c
H_estymator = density(H)
W_estymator = density(W)

plot(H_estymator, xlab = "H")
plot(W_estymator, xlab = "W")

#d
pH = shapiro.test(H)
pH = pH$p.value

pW = shapiro.test(W)
pW = pW$p.value

if ( pH < 0.05 )
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

if ( pW < 0.05 )
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

#e
plot(H, W, xlab = "H", ylab = "W", title("H i W"))

#Zadanie 5 


dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")
#dane2 = read.csv2("mieszkania.csv")
m2 = dane$Metraz
price = dane$Cena
price_m2 = price / m2
rooms = dane$Pokoje
floor = dane$Pietro

#a
matrix = cbind(m2, rooms, price, price_m2)
rp = cor(matrix, method = "pearson")

#b
matrix = cbind(price, m2, price_m2, rooms)
rs = cor(matrix, method = "spearman")

#c
matrix = cbind(price, m2, price_m2, rooms)
rk = cor(matrix, method = "kendall")
#d
# im bardziej wartośc bezwzględna ze wspólczynnika korelacji jest blizsza 1, tym wystepuje
# mocniejsza korelacja. 

#e
prp = cor.test(price_m2, m2, method = "pearson")
prp = prp$p.value
prs = cor.test(price_m2, m2, method = "spearman")
prs = prs$p.value
prk = cor.test(price_m2, m2, method = "kendall")
prk = prk$p.value

if (prp  < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

if (prs < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

if ( prk < 0.05)
{
  print("Dowody przeciwko")
} else{
  print("Brak dowodów przeciwko")
}

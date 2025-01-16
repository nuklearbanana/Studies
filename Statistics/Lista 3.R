#1
a = dbinom(5,6,0.5)
b = pbinom(3, 6, 0.5, lower.tail = FALSE)
c = sum(dbinom(2:4,6,0.5))
#d
p <- dbinom(0:6,6,0.5)
barplot(p, names.arg = 0:6, xlab = "Liczba reszek", ylab = "Prawd.", main = "Rozkład liczby  6 rzutach")

#2
a = dpois(5,6)
b = ppois(4,6,lower.tail = FALSE)
c = sum(ppois(3:5,6))
p <- dpois(0:30,6)
barplot(p, names.arg = 0:30, xlab = "Liczba samochodów sprzedanych w ciągu 2 tygodni", ylab = "Prawdopodobieństwo", main = "Rozkład zmiennej X")

#4

a = dbinom(27,180,1/6)
b = pbinom(32,180,1/6,lower.tail = FALSE)
c = pbinom(28,180,1/6)
d = sum(dbinom(25:33,180,1/6))

#5
a = dpois(16,17.5)
b = ppois(20,17.5,lower.tail = FALSE)
c = ppois(11,17.5)
d = sum(dpois(14:21,180))

#6
a = dbinom(0:100,100,0.02)
plot(0:100,a,type = "b",col = "blue", xlab = "Wartość X", ylab = "Prawdopodobieństwo", main = "Rozkład zmiennej X")
b = dpois(0:100,2)
lines(0:100, b, type = "b", col = "red")


#3 
a = c(1,2,3,4)
b = c(0.2,0.4,0.3,0.1)
E = sum(a*b)
E2 = sum(a^2*b)
Var = E2 - E^2

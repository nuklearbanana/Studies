#1
a <- punif(7,4,12)
b <- sum(punif(5:7,4,12))
c <- punif(10,4,12,lower.tail = FALSE)
d <- qunif(0.6,4,12)
#2
a <- pexp(0.5,4,lower.tail = FALSE)
b <- pexp(1/3,4)
c <- pexp(4/3,4) - pexp(2/3,4)
d <- qexp(0.2,4)
#wykres
t <- seq(0, 3, by = 0.01)
gestosc <- dexp(t, rate = 4)
plot(t, gestosc, type = "l", xlab = "t", ylab = "gęstość", main = "Wykres gęstości zmiennej T")
grid()
#3
a <- 1 - pexp(2,1/3)
b <- pexp(4,1/3)
c <- pexp(5,1/3) - pexp(3,1/3)
d <- qexp(0.4,1/3)
#4
pnorm(180,170,12,lower.tail = FALSE)
b <- pnorm(165,170,12)
c <- pnorm(190,170,12) - pnorm(155,170,12)
#wykres
gestosc <- dnorm(130:210,170,12)
x <- seq(130:210)
plot(x, gestosc, type = "l", xlab = "X", ylab = "Gęstość prawdopodobieństwa", main = "Wykres gęstości zmiennej X")

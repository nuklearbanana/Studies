#Zadanie 1
#a
polacy = c(68,80,74,62)
brytyjczycy = c(85, 67, 79, 73)
chinczycy = c(60, 66, 57)
average = c(mean(polacy),mean(brytyjczycy),mean(chinczycy))
size = c(length(polacy),length(brytyjczycy),length(chinczycy))
observations = c(polacy,brytyjczycy,chinczycy)
main_average = mean(observations)
main_size = length(observations)
#Suma kwadratów
sqr_sum = sum((observations - main_average)^2)
sqr_sum_btw_groups = sum(size*(average - main_average)^2)
sqr_polska = sum((polacy - mean(polacy))^2)
sqr_anglia = sum((brytyjczycy - mean(brytyjczycy))^2)
sqr_chiny = sum((chinczycy - mean(chinczycy))^2)
sqr_sum_in_groups = sqr_polska + sqr_anglia + sqr_chiny
sqr_anglia = sum((brytyjczycy - mean(brytyjczycy))^2)
#Stopnie Swobody
dfMG = length(size)-1
dfWG = main_size - length(size)
dfC = main_size - 1
#Srednia kwadratów
sqr_average_btw = sqr_sum_btw_groups/dfMG
sqr_average_in = sqr_sum_in_groups/dfWG
sqr_average = sqr_sum/dfC

#Uzupełnienie tabeli
tabel = data.frame("Suma kwadratow" = c(sqr_sum_btw_groups,sqr_sum_in_groups,sqr_sum),
                   "Stopnie swobody" = c(dfMG,dfWG,dfC),
                   "Srednia kwaadratow" = c(sqr_average_btw,sqr_average_in,sqr_average)
)
rownames(tabel) = c("MG", "WG", "C")
print(tabel)
#b
f = sqr_sum_btw_groups / sqr_sum_in_groups
p = 1 - pf(f,dfMG,dfWG)
#c
if (p < 0.05)
{
  print("Nie ma wystarczających dowodów, aby odrzucić hipotezę")
} else {
  print("Są dowody, aby odrzucić hipotezę")
}
#d
nationality = factor(c(rep("Polacy", length(polacy)), rep("Brytyjczycy", length(brytyjczycy)), rep("Chinczycy", length(chinczycy))))
model = aov(observations ~ nationality)
summary(model)

#Zadanie 2
library(readxl)
dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")

#a 
result = aov(Metraz ~ Dzielnica,dane)
summary(result)
#b
tukey_result = TukeyHSD(result) #porównywanie średnich metrazy miedzy dzielnicami
print(tukey_result)

#Zadanie 3
library(readxl)
dane = read.csv("mieszkania.csv",header = TRUE,sep = ";")
#a
dane$Kategoria = ifelse(dane$Pokoje == 1, "Jednopokojowe",
                        ifelse(dane$Pokoje == 2, "Dwupokojowe",
                               ifelse(dane$Pokoje == 3, "Trzypokojowe", "Wielopokojowe")))
#b
result = aov(Cena ~ Kategoria,dane)
summary(result)
#c
tukey_result = TukeyHSD(result) 
print(tukey_result)


#Zadanie 1

people = 1000
educated = 385
average_educated = educated/people
wkz_5 = qnorm(0.975)
women = 520
men = 480
#a
hipoteza = 0.4
stat_test = (average_educated - hipoteza)/sqrt((average_educated*(1 - average_educated))/people)
#Test Z
pz = 2*(1 - pnorm(abs(stat_test)))
#Test prob
pt = prop.test(educated,people,hipoteza)
pt = pt$p.value


if (pz < wkz_5) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

if (pt <0.05) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

#b 

educated_women = 220
educated_men = 165
av_ed_women = educated_women/women
av_ed_men = educated_men/men
estymator_error_women = (av_ed_women*(1-av_ed_women))/sqrt(women)
estymator_error_men = (av_ed_men*(1-av_ed_men))/sqrt(men)

stat_test = ((av_ed_women - av_ed_men))/sqrt(estymator_error_women+estymator_error_men)
#Test Z
pz = 2*(1 - pnorm(abs(stat_test)))
#Test prob
pt = prop.test(c(educated_women,educated_men),c(women,men))
pt = pt$p.value


if (pz < wkz_5) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

if (pt <0.05) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

#c
average_women_h = 166
women_var = 166
average_men_h = 174
men_var = 121
stat_test = (average_women_h - average_men_h)/sqrt(women_var/women + men_var/men)
pz = 2*(1-pnorm(abs(stat_test)))
if (pz < wkz_5) 
{
  print("Zależy od plci")
} else
{
  print("Niezalezy od plci")
}

#Zadanie 2

library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

population = length(dane$plec)
women = sum(dane$plec == 1)
men = sum(dane$plec == 0)
prop = 0.5
standard_error = sqrt(prop*(1-prop)/population)
stat_test = ((men/population) - (women/population))/standard_error
pz = 2*(1-pnorm(abs(stat_test)))
pt = prop.test(c(women,men),c(population,population))
pt = pt$p.value


if (pz < wkz_5) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

if (pt <0.05) 
{
  print("Mamy dowody, aby odrzucić hipotezę")
} else
{
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

#Zadanie 3

library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

average_weight = mean(dane$Waga_po)
av_women_weight = mean(dane$Waga_po[dane$plec == 1])
av_men_weight = mean(dane$Waga_po[dane$plec == 0])
women = sum(dane$plec == 1)
men = sum(dane$plec == 0)
sd_women = sd(dane$Waga_po[dane$plec == 1])
sd_men = sd(dane$Waga_po[dane$plec == 0])
stat_test = (av_women_weight - av_men_weight)/sqrt((sd_women^2/women)+(sd_men^2/men))
pz = 2*(1-pnorm(abs(stat_test)))
pt = t.test(dane$Waga_po[dane$plec == 1],dane$Waga_po[dane$plec == 0])
pt = pt$p.value

if (pz < wkz_5) {
  print("Mamy dowody, aby odrzucić hipotezę (test Z)")
} else {
  print("Nie mamy dowodów, aby odrzucić hipotezę (test Z)")
}

if (pt < 0.05) {
  print("Mamy dowody, aby odrzucić hipotezę (test t)")
} else {
  print("Nie mamy dowodów, aby odrzucić hipotezę (test t)")
}

#Zadanie 4

library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")
women = sum(dane$plec == 1)
men = sum(dane$plec == 0)
prop_women = sum(dane$plec == 1 & dane$Waga_po > 70)/women
prop_men = sum(dane$plec == 0 & dane$Waga_po > 70)/men
stat_test = (prop_women - prop_men)/sqrt((prop_women*(1-prop_women))/women + (prop_men*(1-prop_men))/men)
pz = 2*(1 - pnorm(abs(stat_test)))
pt = t.test(dane$Waga_po[dane$plec == 1 & dane$Waga_po > 70],dane$Waga_po[dane$plec == 0 & dane$Waga_po > 70])
pt = pt$p.value
od = 1000*0.5/2  
sm = rbinom(1000,men,prop_women)
sk = rbinom(1000,women,prop_men)
roz = sort(sm/men-sk/women)
dolny = roz[od+1]
gorny = roz[1000-od]

#Zadanie 5
library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

hipoteza = -5
av_men_height = mean(dane$Wzrost[dane$plec == 0])
av_women_height = mean(dane$Wzrost[dane$plec == 1])
women = sum(dane$plec == 1)
men = sum(dane$plec == 0)
sd_women = sd(dane$Wzrost[dane$plec == 1])
sd_men = sd(dane$Wzrost[dane$plec == 0])
stat_test = (av_men_height - av_women_height - hipoteza)/sqrt((sd_women^2 / women) + (sd_men^2 / men))
#Test Studenta
pt = 2 * pt(abs(stat_test),min(women - 1, men - 1))

if (pt < 0.05) {
  print("Mamy dowody, aby odrzucić hipotezę")
} else {
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

#Zadanie 6
library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

przybralo = sum((dane$Waga_po - dane$Waga_przed) > 0)
hipoteza = 0.8
populacja = length(dane$Waga_po)
prop = przybralo/populacja
stat_test = (prop - hipoteza)/sqrt(prop*(1-prop)/populacja)
pz = 2*(1-pnorm(abs(stat_test)))

if (pz < wkz_5) {
  print("Mamy dowody, aby odrzucić hipotezę")
} else {
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}

#Zadanie 7
library(readxl)
dane = read.csv("waga1.csv",header = TRUE,sep = ";")

studentki = sum(dane$Wzrost > 170 & dane$plec == 1)
studenci = sum(dane$Wzrost > 170 & dane$plec == 0)
women = sum(dane$plec == 1)
men = sum(dane$plec == 0)
prop_men = studenci/men
prop_women = studentki/women
stat_test = (prop_men - prop_women)/sqrt((prop_men*(1-prop_men))+(prop_women*(1-prop_women)))
pz = 2*(1-pnorm(abs(stat_test)))
od = 1000 * 0.02 / 2  
sm = rbinom(1000, men, prop_men)
sk = rbinom(1000, women, prop_women)
roz = sort(sm / men - sk / women)
dolny = roz[od + 1]
gorny = roz[1000 - od]

if (pz < wkz_5) {
  print("Mamy dowody, aby odrzucić hipotezę")
} else {
  print("Nie mamy dowodów, aby odrzucić hipotezę")
}






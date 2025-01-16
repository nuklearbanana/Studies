#1
#i
dane = matrix(c(1/8, 1/4, 1/8, 1/6, 1/6, 1/6),2,3,TRUE) 
brzegx = rowSums(dane) 
brzegy = colSums(dane)
#ii
EX = sum(0:1 * brzegx)
EY = sum(0:2 * brzegy)
EXY = 0
warunkowey = c()
condition = TRUE
for (i in 1:2)
{
  for (j in 1:3)
  {
    EXY = EXY +  dane[i,j]*(i-1)*(j-1)
    warunkowey = c(warunkowey,(dane[i,j])/brzegx[i]) #iii
    if (brzegx[i]*brzegy[j] != dane[i,j])
    {
      condition = FALSE
    }
  }
}
y = c(0,1,2)
x = c(0,1)
cov = EXY - (EX*EY)
varx = sum(x ^2 * brzegx) - EX^2
vary = sum(y ^2 * brzegy) - EY^2
#iiii
#Nie są niezależne, ponieważ condition = FALSE co oznacza, że istnieje 
#co najmniej jedna para liczb P(X = x,Y=y) i P(X=x)*P(Y=y) które nie są sobie równe

#3

rozklad <- matrix(c(
  0.05, 0.03, 0.02, 0.0, 0.0, 0.0,
  0.05, 0.07, 0.05, 0.03, 0.0, 0.0,
  0.03, 0.05, 0.06, 0.04, 0.02, 0.0,
  0.01, 0.04, 0.06, 0.06, 0.02, 0.01,
  0.0, 0.02, 0.05, 0.08, 0.04, 0.01,
  0.0, 0.01, 0.01, 0.02, 0.03, 0.03
), nrow = 6,6, byrow = TRUE)
rownames(rozklad) = c(2, 3, 3.5, 4, 4.5, 5)
wiersz = c(2, 3, 3.5, 4, 4.5, 5)
colnames(rozklad) = c(2, 3, 3.5, 4, 4.5, 5)
kolumna = c(2, 3, 3.5, 4, 4.5, 5)
print(rozklad)
brzeg_wiersz = rowSums(rozklad) #I
brzeg_kolumn = colSums(rozklad) #I
EX = sum(wiersz * brzeg_wiersz)
EY = sum(kolumna * brzeg_kolumn)
EX2 = sum((wiersz * wiersz) * brzeg_wiersz)
EY2 = sum((kolumna * kolumna) * brzeg_kolumn)
EXY = 0
wy = numeric(0)
for (i in 1:6)
{
  for (j in 1:6)
  {
    EXY = EXY +  rozklad[i,j]*wiersz[i]*kolumna[j]
    wy = c(wy,rozklad[j,i]/brzeg_wiersz[j]) #III
  }
}

varx = EX2 - EX^2
vary = EY2 - EY^2

cov = EXY - (EX*EY)
varx = EX2 - (EX*EX)
vary = EY2 - (EY*EY)
P = cov/sqrt(varx * vary) #II

m = 6
n = 6
x = c(2,3,3.5,4,4.5,5)
y = c(2,3,3.5,4,4.5,5)
wy = array(0,dim=c(m,n))
for ( i in 1:m)
{
  wy[i,] = rozklad[i,1:n]/brzeg_wiersz[i]
}

sx<-array(0,dim=m)
sx[1]<-brzeg_wiersz[1]
for (i in 2:m){
  sx[i]<-sx[i-1]+brzeg_wiersz[i]
}
# p'stwaskumulowane dla zmiennej Y przy danej X
sy<-array(0,dim=c(m,n))
sy[,1]<-wy[,1]
for (j in 2:n){
  sy[,j]<-sy[,j-1]+wy[,j]
}
sx
sy
N<-1000
x_rea<-array(0,dim=N)
y_rea<-array(0,dim=N)
for (k in 1:N){
  # generowanie x
  u<-runif(1)
  ii<-1
  while (u>sx[ii]){
    ii<-ii+1    
  }
  x_rea[k]<-x[ii]
  # generowanie y z rozkładu warunkowego
  u<-runif(1)
  jj<-1
  while (u>sy[ii,jj]){
    jj<-jj+1
  }
  y_rea[k]<-y[jj]
}
mat_rea<-cbind(x_rea,y_rea)
tab<-table(x_rea,y_rea)
(tab_r<-tab/length(x_rea))
(r_p<-cor(x_rea,y_rea))
(r_s<-cor(x_rea,y_rea,method="spearman"))
(r_k<-cor(x_rea,y_rea,method="kendall"))

#2


m = 2
n=3
mn = 6
# p'stwa skumulowane
s<-array(dim=mn)
s[1]<-pv[1]
for (i in 2:mn){
  s[i]=s[i-1]+pv[i]
}
# realizacja
x_rea<-array(dim=1000)
y_rea<-array(dim=1000)
# 1000 realizacji z U[0,1]
r<-runif(1000)
for (j in 1:1000){
  i<-1
  while (r[j]>s[i]){
    i<-i+1
  }
  x_rea[j]<-xv[i]
  y_rea[j]<-yv[i]
}
mat_rea<-cbind(x_rea,y_rea)
tab<-table(x_rea,y_rea)
(tab_r<-tab/length(x_rea))
(r_p<-cor(x_rea,y_rea))
(r_s<-cor(x_rea,y_rea,method="spearman"))
(r_k<-cor(x_rea,y_rea,method="kendall"))

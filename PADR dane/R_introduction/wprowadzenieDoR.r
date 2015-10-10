#ustawianie katalogu roboczego
setwd("~/cwiczenieR")
getwd()

#korzystanie z pomocy
help.start()
?Arithmetic
?log
??median

#operacje na liczbach:
3 + 2
3^2
sqrt(9)
log2(8)
log(125,5)
125 %% 3
125 %/% 3
41*3 + 2

#operacje na wektorach:
1:10
c(1,2,3,4,5)
c(1,3,5, 8:12, 20, 22)
(1:10) - 1
(1:10) * 2
2^(1:10)
(1:10)^2
sum(1:10)
mean(1:10)
(1:10)*(10:1)

rep(1, 10)
rep(1:2, 5)
rep(1:2, each = 5)

seq(1,10,by=1)
seq(1,10,length.out = 20)
rep(1:5, seq(2,10, by=2))

1:10 %*% 10:1
1:10 %*% 1:10

#operacje na macierzach
1:10 %*% t(1:10)

matrix(1:100, nrow = 10, ncol = 10)
matrix(1:100, nrow = 10, byrow=T)
matrix(rep(1:5, seq(2,10, by=2)), nrow = 10)

diag(1:10)
diag(1:10 %*% t(1:10))

myMatrix = matrix(c(1,2,3,3,2,1,1,2,1), nrow = 3, byrow=T)
myMatrix
myMatrix * myMatrix
myMatrix + 1
myMatrix + 1:3
myMatrix * 2
myMatrix * 1:3

solve(myMatrix)
solve(myMatrix, c(2,3,1))
myMatrix %*% solve(myMatrix, c(2,3,1))

#porownywanie liczb: <, <=, >, >=, ==, !=
1 < 2
1:10 > 5
1:10 == c(1:3, 6:4, 7:10)

#przypisania =, <-, <<-, ->, ->>
x = 4
y <- 5
6 -> z
c(x, y, z)

#operatory logiczne !, &, |, &&, ||, xor(), any(), all(), which()
x = 2 > 1
x & 3 < 4
!x | 5^5 > 5*5
xor(x, 5^5 > 5*5)
any(1:10 > 5)
all(1:10 > 5)
which(1:10 != c(1:3, 6:4, 7:10))

#podstawowe typy i struktury danych, rzutowanie
#typy atomowe: logical, integer, numeric, complex, character, raw
#podstawowe struktury: wektor, lista
class(1:10)
class(myMatrix)
typeof(myMatrix)
typeof(TRUE)
is(1:10)
is(as.numeric(1:10))
class("abc")
is(1)
length("abc")
nchar("abc")

integer(0)
character(10)
numeric(10)


x = c(1:3, 4.5)
class(x)
length(x)
names(x)
names(x) = c("a", "b", "c", "D")
names(x)
x[7] = "d"
x

y = 1234
as.character(y)

myList = list(wektor = x, etykieta = y)
myList
myList$wektor
myList$wek
myList$w
myList[[2]] #wybiera drugi element
myList[2]   #wybiera podliste
class(myList[[2]])
class(myList[2])

#ramki danych - podstawowa struktura do przechowywania tablic danych
myDataFrame = data.frame(0)
myDataFrame = as.data.frame(myMatrix)
is(myDataFrame)
as.list(myDataFrame)

data() #lista zbiorow danych dostepnyc w zaladowanych bibliotekach
iris
myDataFrame = iris
head(myDataFrame)
dim(myDataFrame)
nrow(myDataFrame)
ncol(myDataFrame)
colnames(myDataFrame)
fix(myDataFrame)

#mozemy dodawac wiersze i kolumny:
myDataFrame = cbind(myDataFrame, myDataFrame[,1] * myDataFrame[,2] - 1)
#przy dodawaniu wierszy nalezy pamietac o zachowaniu typow kolumn
myDataFrame = rbind(myDataFrame, myDataFrame[1:3,])

#rozne sposoby indeksowania wektorow, macierzy i list
myVector = seq(200, 0, -2)
length(myVector)
myVector[c(81,82,83,84,85,86,87,88,89,90)]
myVector[81:90]
myVector[seq(81,90,1)]
myVector[c(81,82,83:86,seq(87,90,1))]
myVector[c(rep(F,80),rep(T,10),rep(F,length(myVector)-90))]
myVector[1:length(myVector) %in% 81:90]
myVector[which(1:length(myVector) <= 90 & 1:length(myVector) >= 81)]
myVector[1:length(myVector) <= 90 & 1:length(myVector) >= 81]

#modyfikowanie wektorow
myVector1 = as.integer(myVector > 100)
myVector2 = integer(length(myVector))
myVector2[1:50] = 1
myVector3 = character(length(myVector))
myVector3[myVector %% 4 == 0] = "class1"
myVector3[myVector3 != "class1"] = "class2"

myFactor = as.factor(myVector3)
is(myFactor)
levels(myFactor)
as.integer(myFactor)
as.character(myFactor)

#indeksowanie macierzy i ramek danych
myDataFrame
fix(myDataFrame)
myDataFrame[2,1]
colnames(myDataFrame)
rownames(myDataFrame)
rownames(myDataFrame)[1:3] = c("a", "b", "c")
myDataFrame[,1]
myDataFrame$Sepal.L
myDataFrame["a",]
myDataFrame[1,]
myDataFrame[c(1,3),2:3]

#indeksy nie musza byc unikatowe
myDataFrame[c(1,1,2,3,1,1,2),]

#podstawowe statystyki, agregacje: abs, sum, min, max, pmin, pmax, quantile, median, prod, mean, rank, order, sort
sum(myVector)
min(myVector)
rank(myVector)
mean(myVector)
sort(myVector)
max(myVector, sort(myVector))
pmax(myVector, sort(myVector))

rnorm(10, mean=1.2, sd=3.4)
rnorm(100)
hist(rnorm(100))

#podstawowe konstrukcje programistyczne w R:
#apply, sapply, lapply
apply(myDataFrame[1:4], 1, sum)
apply(myDataFrame[1:4], 2, mean)

sapply(myDataFrame[1:4], mean)
lapply(myDataFrame[1:4], median)

#instrukcje warunkowe if else:
if(_warunek_) {}
else {}

if(mean(myDataFrame$Sepal.L) > min(myDataFrame$Sepal.W)) print("L > W") else print("L <= W")

#petle - uzywac w ostatecznosci:
#for(name in _wyrazenie1_) {_wyrazenie2_}
#while(_warunek_) {_wyrazenie_}
#petla nieskonczona: repeat _wyrazenie_

sumVec = numeric(nrow(myDataFrame))
for(i in 1:nrow(myDataFrame)) sumVec[i] = sum(myDataFrame[i,1:4])

#definiowanie wlasnych funkcji:
myFunction = function(x, y) {
    x^2 - y^2
}

myFunction(3,2)

#rekurencja:
multiply = function(x,y,w = 0)  {
  if(y==0) w 
  else multiply(x, y-1, w+x)
}

multiply(4,5)

#lista obiektow w pamieci
ls()

#zapisywanie sesji
save.image()

#usuwanie wszystkiego z pamieci i zwalnianie zasobow:
rm(list = ls()); gc()

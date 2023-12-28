zvars <- rnorm(100)
plot(zvars)

par(pty="s", bty="l", lwd=2, pin=c(3,3), las=1)

plot(zvars, col="red")
plot(zvars, col="deepskyblue")

pie(rep(1,16), col=1:16)

students <- c(3545,2739,3226,4183,3342,2426)
college = c("College")
class <- c("Freshman","Sophmore","Junior","Senior","Other(UG)", "Graduate")
thismatrix <- matrix(students, nrow = 1, ncol = 6,byrow = T, dimnames = list(college,class))
thismatrix

pie(thismatrix,col = 1:6, main = "Total Number of College Students in Each Class")

plot(zvars, col=2)

names(students) = c("Freshman","Sophmore","Junior","Senior","Other(UG)", "Graduate")

pie(students, main = "Total Number of College Students in Each Class", col = 1:6)

chickwts

stem(chickwts$weight)

a = round(chickwts$weight, -1)
sort(a)

stem(chickwts$weight, scale = 4)

meat = c(8,10,16,25,41)
names(meat) = c("Lamb", "Mutton", "Pigmeat", "Poultry","Beef")
pie(meat, main = "New Zealand Meat Consumption")

c <- data.frame(1:24)
c

list(c)

a <- array(1:24, dim = c(4,3,2))
a

mynumbers = c(5,10,20)
names(mynumbers) = c("Five", "Ten", "Twenty")
pie(mynumbers, main = "How does it add up?")

WKUcolors = c("red", "white", "black")

barplot(meat, col="violetred", main = "N.Z. Meat Consumption")
box()

barplot(meat, col = c("red","orange","yellow","green","blue","purple"), main = "N.Z. Meat Consumption",)
box()

barplot(sort(meat, decreasing = T), col = "springgreen2", main = "N.Z. Meat Consumption")
box()

cigs = read.csv("c:/STAT_330/cigarettes.csv")
cigs

Autin.list <- list(name = c("Beth", "Matthew", "Alison", "Melanie"), order = c(1,2,3,4), age = c(46,43,41,39))
Autin.list

Autin.dfr <- data.frame(name = c("Beth","Matthew","Alison","Melanie"), order = c(1,2,3,4), age = c(46,43,41,39))
Autin.dfr

data("VADeaths")

VADeaths

VARural = VADeaths[,1:2]

VAMales.mat = VADeaths[,c(1,3)]
VAMales.mat

VAMales = apply(VAMales.mat,1,mean)
VAMales

cigs$Tar
cigs[,3]

cigs[1:10, 4:5]
cigs[12,c(1,2)]

subset(cigs, Tar >= 10, c(1,3))

seq(0,10,0.5)

seq(-pi,pi)

halpvec = rep("halp me", 36)
halpvec

halpmat = matrix(halpvec, nrow = 6, ncol = 6, byrow = T)
halpmat

halpmat2 = matrix(rep("halp me", 36), nrow = 6, ncol = 6, byrow = T)
halpmat2

fives = matrix(seq(5,200,5), nrow = 5, ncol = 8, byrow = T)
fives

sumvector = matrix(nrow = 1, ncol = 5)
for (i in 1:5) {
  sumvector[i] = sum(fives[i,])
}
sumvector

sumvector2 = apply(fives,1,sum)

demo(graphics)

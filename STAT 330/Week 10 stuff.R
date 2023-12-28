for (i in 1:20) {
  print(i)
  if (i > 10){
    print("Please stop print")
    break
  }
}

for (i in seq(100,300,100)) {
  x <- rnorm(500, i, i/5)
  windows()
  hist(x)
  print(mean(x))
  print(sd(x))
}

x <- matrix(1:25, nrow = 5, ncol = 5)
x
m = matrix( nrow = 1,ncol = 5)
m
for (i in 1:5) {
  m[i] <- mean(x[,i])
  
}

total <- 0
for (i in 1:1000) {
  total <- total + i
  print(total)
}

total <- 0
for (i in 1:100) {
  i <- i^2
  total <- total + i
  print(total)
}

m2 <- apply(x,2,mean)
m3 <- apply(x,1,mean)

names(Autin.dfr)[names(Autin.dfr) == "Autin.list.Name"] <- "Name"
names(Autin.dfr)[names(Autin.dfr) == "Autin.list.Order"] <- "Order"
names(Autin.dfr)[names(Autin.dfr) == "Autin.list.Age"] <- "Age"
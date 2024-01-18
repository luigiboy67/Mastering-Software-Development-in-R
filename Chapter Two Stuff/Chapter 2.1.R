# 2.1

# The learning objectives of the section are:

# Describe the control flow of an R program

# Control structures in R allow you to control the flow of execution of a series of R expressions.

# 2.1.1

# if-else allows you to test a condition and act on it depending on whether it's true or false
# ex:

## Generate a uniform random number
x <- runif(1, 0, 10)  
if(x > 3) {
  y <- 10
} else {
  y <- 0
}

# 2.1.2

# For loops takes an iterator variable and assign it successive values from a sequence or vector.

# ex:
numbers <- rnorm(10)
for(i in 1:10) {
  print(numbers[i])
}

# here's another example
x <- c("a", "b", "c", "d")

for(i in 1:4) {
  ## Print out each element of 'x'
  print(x[i])  
}

# seq_along() function is commonly used in conjunction with for loops in order to generate an integer based on the length of the object.

## Generate a sequence based on length of 'x'
for(i in seq_along(x)) {   
  print(x[i])
}

# not necessary to use an index-type variable
for(letter in x) {
  print(letter)
}

# one line loops, the curly braces are not strictly necessary
for(i in 1:4) print(x[i])

# 2.1.2.1

# nested loops are commonly needed for multidimensional or hierarchical data structures
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }   
}

# 2.1.3

# next is used to skip an iteration of a loop
for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next                 
  }
  ## Do something here
  print(i)
}

# break is used to exit a loop immediately, regardless of iteration
for(i in 1:100) {
  print(i)
  
  if(i > 20) {
    ## Stop loop after 20 iterations
    break  
  }     
}


# Chapter 1 The R Programmin Environment

# 1.1

# 1.1.1
#At the R prompt we type expressions. The <- symbol (gets arrow) is the assignment operator.
x <- 1
print(x)
x
msg <-  "hello"

# the # character indicates a comment. Anything to the right of the # (including the # itself) is ignored.

x <- ## Incomplete expression
  
x <- 5
x

print(x)


# The [1] shown in the output indicates that x is a vector and 5 is its first element.
# When an R vector is printed you will notice that an index for the vector is printed in square brackets [] on the side.
x <- 11:30
x

# Note that the : operator is used to create integer sequences

# 1,1.2

# R has five basic or "atomic" classes of objects: character, numeric (real numbers), integer, complex, logical (True/False)
# Empty vectors can be created with the vector() function.
# A vector can only contain objects of the same class.

#1.1.3
# Numbers in R are generally treated as numeric objects (i.e. double precision real numbers)
# If you explicitly want an integer, you need to specify the L suffix.
# So entering 1 in r gives you a numeric object
# entering 1L explicitly gives you an integer object.
c(1)
c(1L)

# Inf or infinity will allow us to represent entities like 1 / 0.
1/0

# 1/Inf is 0
1/Inf

# The value NaN represents an undefined value ("not a number").
0/0

# 1.1.4
# c() function can be used to create vectors of objects by concatenating things together.
x <- c(0.5, 0.6)       ## numeric
x <- c(TRUE, FALSE)    ## logical
x <- c(T, F)           ## logical
x <- c("a", "b", "c")  ## character
x <- 9:29              ## integer
x <- c(1+0i, 2+4i)     ## complex

# you should try to use TRUE and FALSE more often. T and F is a more lazy way
# you can also use the vector() function to initialize vectors.
x <- vector("numeric", length = 10)
x

# 1.1.5

y <- c(1.7, "a")   ## character
y <- c(TRUE, 2)    ## numeric
y <- c("a", TRUE)  ## character

# When different objects are mixed in a vector, coercion occurs so that every element in the fector is of the same class.
# Example above, we see the effect of implicit coercion.
# What R tries to do is find a way to represent all of the objects in the vector in a reasonable fashion

# 1.1.6

# Objects can be explicitly coerced from one class to another using the as.* functions
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# Sometimes, R can't figure out how to coerce an object and this can result in NAs being produced
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)


# When nonsensical coercion takes place, you will usually get a warning from R.

# 1.1.7

# Matrices are vectors with a dimension attribute. 
# The dimension attribut is itself an integer vector of length 2 (number of rows, number of columns)
m <- matrix(nrow = 2, ncol = 3) 
m
dim(m)
attributes(m)

# Matrices are constructed column-wise, so entries can be thought of starting in the "upper left" corner and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3) 
m

# Matrices can be created by column-binding or row-binding with the cbind() and rbind() funtions.
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y) 

# 1.1.8 

# Lissts are a special type of vecto that can contain elements of different classes.
# Lists, in combination with the various "apply" functions discussed later, make for a powerful combination
# Lists can be explicitly created using the list() function, which takes an arbitrary number of arguments.
x <- list(1, "a", TRUE, 1 + 4i)
x

# We can also create an empty list of a prespcified length with the vector() function
x <- vector("list", length = 5)
x

# 1.1.9

# Factors are used to represent categorical data and can be unordered or ordered.
# Factos are important in statistical modeling and are treated specially by modleing functions like lm() and glm()
# Factor object can be created with the factor() function.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
## see the underlying representation of factor
unclass(x)

# Often factos will be automatically created for you when you read a dataset in using a function like read.table().
# The order of the levels of a factor can be set using the levels argument to factor().
x <- factor(c("yes", "yes", "no", "yes", "no"))
x # levels are put in alphabetical order
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

# 1.1.10
# Missing values are denoted by NA or NaN for undefined mathematical operations.
# is.na() is used to test objects if they are NA
# NA values have a class also, so there are integer NA. character NA, etc.
# A NaN value is also NA but the converse is not true

## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)  
## Return a logical vector indicating which elements are NA
is.na(x)    

## Return a logical vector indicating which elements are NaN
is.nan(x)   

## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x)

is.nan(x)

# 1.1.11
# Data frames are used to store tabular data in R
# Data frames are represented as a special type of list where every element of the list has to have the same length.
# Data frames can store different classes of objects in each column.
# Data frames have a special attribute called row.names which indicate information about each row of the data frame.
# Data frames are usually created by reading in a data set using the read.table() or read.csv(). Can also just create a new one with data.frame().
# Data frames can be converted to a matrix by calling data.matrix()
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x
nrow(x)
ncol(x)

# 1.1.12

# R objects can have names, which is very useful for writing readable code and self-describing onjects.
x <- 1:3
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles") 
x
names(x)

# Lists can also have names, which is often very useful.
x <- list("Los Angeles" = 1, Boston = 2, London = 3) 
x
names(x)

# Matrices can have both column and row names.
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) 
m

# Column names and row names can be set separatelt using colnames() and rownames() functions.
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")

# As a review:
# Object  set column names  set row names
# data frame  names()         row.names()
# matrix   colnames()        rownames()

# 1.1.13
# R objects can have atrtibutes, which are like metadata for the object. 
# Some examples of R object attributes are: name, dimnames, dimensions (e.g. matrices, arrays), class (e.g. integer, numeric), length, other user-defined attributes/metadata
# Attributes of an pbject (if any) can be accessed using the attributes() function. Not all R objects contain attributes, which can return NULL


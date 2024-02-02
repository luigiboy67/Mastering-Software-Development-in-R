# 2.3

# The learning objectives of the section are:

# Describe functional programming concepts
# Write functional programming code using the purrr package

# 2.3.1

# Functional programming is a programming philosophy based on lambda calculus.
# Functional programming concentrates on four constructs:
# Data (numbers, strings, etc)
# Variables (function arguments)
# Functions
# Function Application (evaluating functions given arguments and/or data)

# You can provide a function as an argument to another function, and a function can return another function as its results

# Here's a function that returns a function when evaluated:
adder_maker <- function(n){
  function(x){
    n + x
  }
}

add2 <- adder_maker(2)
add3 <- adder_maker(3)

# Ex above, adder_maker() returns a function with no name.
# The function adds n to its only argument x.

# 2.3.2

# this section explains core functional programming functions and uses the purr library

# 2.3.2.1

# map family of functions applies a function to the elements of a data structure, usually a list or a vector.
# in the purrr package, the map function returns a list, while the map_lgl, map_chr and map_dbl functions vectors of logical values, strings, or numbers respectively.
# Ex

library(purrr)

map_chr(c(5, 4, 3, 2, 1), function(x){
  c("one", "two", "three", "four", "five")[x]
})

map_lgl(c(1, 2, 3, 4, 5), function(x){
  x > 3
})

# map_if() function takes as its arguments a list or vector containing data, a predicate function, and then a function to be applied
# predicate function is a function that returns TRUE or FALSE for each element in the list or vector.
# map_if always returns a list
# Ex:

map_if(1:5, function(x){
  x %% 2 == 0
},
function(y){
  y^2
}) %>% unlist()

# map_at function only applies the provided function to elements of a vector specified by their indexes
# always returns a list()
# ex:
map_at(seq(100, 500, 100), c(1, 3, 5), function(x){
  x - 10
}) %>% unlist()

# map2() function allowa you to map over two data structures
# Ex:
map2_chr(letters, 1:26, paste)

# pmap() family of functions is similar to map2, instead of mapping across two vectors or lists, you can map across any number of lists.
pmap_chr(list(
  list(1, 2, 3),
  list("one", "two", "three"),
  list("uno", "dos", "tres")
), paste)

# Mapping is a powerful technique for thinking about how to apply computational operations to your data.

# 2.3.2.2

# reduce is a iteration functoin that combines first two elements of a vector, then third and so forth until the end. 
# function should take two arguments.
# Ex:

reduce(c(1, 3, 5, 7), function(x, y){
  message("x is ", x)
  message("y is ", y)
  message("")
  x + y
})  

# Another example, but using strings:
reduce(letters[1:4], function(x, y){
  message("x is ", x)
  message("y is ", y)
  message("")
  paste0(x, y)
})

# reduce_right function starts with the last element of a vector anf then proceeds to the second to last element and so forth:
reduce_right(letters[1:4], function(x, y){
  message("x is ", x)
  message("y is ", y)
  message("")
  paste0(x, y)
})

# Before:
reduce_right(1:3, f)

# After:
reduce(1:3, f, .dir = "backward")  # New algorithm
reduce(rev(1:3), f)                # Same algorithm as reduce_right()

# 2.3.2.3

# has_element() and detect() can search for specific elements of a vector
# ex:
has_element(letters, "a")
has_element(letters, "A")

# detect function takes a vector and a predicate function as arguments and it returns the first element of the vector for which the predicate function returns TRUE
detect(20:40, function(x){
  x > 22 && x %% 2 == 0
})

# detect_index function takes the same arguments, however it returns the index:
detect_index(20:40, function(x){
  x > 22 && x %% 2 == 0
})

# 2.3.2.4

# functions that includes keep, discard, every, and some are known as filter functions.
# each of these functions takes a vector and a predicate function

# keep function keeps the elements of a vector that satisfies the predicate function while removing the other elements
# ex:
keep(1:20, function(x){
  x %% 2 == 0
})

# discard function works similarly, but it returns elements that doesn't satisfy the predicate function
# ex:
discard(1:20, function(x){
  x %% 2 == 0
})

# every function returns TRUE if every element in the vector satisfies the predicate function
# ex:
every(1:20, function(x){
  x %% 2 == 0
})

# some functions returns true if at least one element in the vector satisfies the predicate function:
# ex
some(1:20, function(x){
  x %% 2 == 0
})

# compose function combines any number of functions into one function:
# ex:
n_unique <- compose(length, unique)
# The composition above is the same as:
# n_unique <- function(x){
#   length(unique(x))
# }


rep(1:5, 1:5)
n_unique(rep(1:5, 1:5))

# 2.3.3

# 2.3.3.1

# partial application of functions can allow functions to behave a little like data structures.

# partial function from the purr package can specify some of the arguments of a function, and returns a function that only takes the unspecified arguments.
# ex:

library(purrr)

mult_three_n <- function(x, y, z){
  x * y * z
}

mult_by_15 <- partial(mult_three_n, x = 3, y = 5)

mult_by_15(z = 4)

# 2.3.3.2

# Side effects of functions occur whenever a function interacts with the "outside world" - reading or writing data, printing to the console, and displaying a graph are all side effects.

# with the walk function, you can evaluate a function across a data structure.
# Ex:
library(purrr)

walk(c("Friends, Romans, countrymen,",
       "lend me your ears;",
       "I come to bury Caesar,", 
       "not to praise him."), message)

# 2.3.3.3
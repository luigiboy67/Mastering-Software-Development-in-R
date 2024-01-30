# 2.3

# The learning objectives of the section are:

# Describe functional programming concepts
# Write funcional programming code using the purrr package

# 2.3.1

# Functional programming is a programming philosophy based on lambda calculus.
# Functional programming concentrates on four constructs:
# Data (numbers, strings, etc)
# Variables (function arguments)
# Functions
# Function Application (evaluating functions given arguments and/or data)

# You can provide a funciton as an argument to another funciton, and a function can return another function as its results

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
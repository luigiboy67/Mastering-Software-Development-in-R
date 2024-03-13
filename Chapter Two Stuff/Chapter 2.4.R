# 2.4

# the learning objectives of this section are:
# Manipulate R expressions to "compute on the language"
# Describe the semantics of R environments.

# 2.4.1

# Expressions are encapsulated operations that can be executed by R.
# you can create an expression using the quote() function.
two_plus_two <- quote(2 + 2)
two_plus_two

# you can execute this expressions using the eval() function:
eval(two_plus_two)

# when encountering an R code stored as a string, you can use parse() to transform the string to an expression:
tpt_string <- "2 + 2"

tpt_expression <- parse(text = tpt_string)

eval(tpt_expression)

# you can reverse this process and transform an expression into a string using deparse()
deparse(two_plus_two)

# you can access and modify their contents like a list()
sum_expr <- quote(sum(1, 5))
eval(sum_expr)
sum_expr[[1]]
sum_expr[[2]]
sum_expr[[3]]
sum_expr[[1]] <- quote(paste0)
sum_expr[[2]] <- quote(4)
sum_expr[[3]] <- quote(6)
eval(sum_expr)

# compose expressions using the call function. First argument is a string containing the name of a function, followed by the arguments provided that function.
sum_40_50_expr <- call("sum", 40, 50)
sum_40_50_expr
eval(sum_40_50_expr)

# You can capture the expression an R user typed into the R console when they executed a function by including match.call()
return_expression <- function(...){
  match.call()
}

return_expression(2, col = "blue", FALSE)
return_expression(2, col = "blue", FALSE)

# You could of course then manipulate this expression inside of the function you're writing.
# Ex:
first_arg <- function(...){
  expr <- match.call()
  first_arg_expr <- expr[[2]]
  first_arg <- eval(first_arg_expr)
  if(is.numeric(first_arg)){
    paste("The first argument is", first_arg)
  } else {
    "The first argument is not numeric."
  }
}

first_arg(2, 4, "seven", FALSE)

first_arg("two", 4, "seven", FALSE)

# 2.4.2
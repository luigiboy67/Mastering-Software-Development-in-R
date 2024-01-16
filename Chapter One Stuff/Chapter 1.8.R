# 1.8

# the learning objectives of this section are to:
# describe how memory is used in r sessions to store objects

# the pryr package provides a number of useful functions for interrogating the memory usage of your R sessions.
# mem_used function tells you how much memory your current R session is using.
library(pryr)
mem_used()

# primary use of this function is to make sure your memory usage in R isn't getting too big.
# object_size function allows you to see the memory usage of objects in your workspace
ls()
object_size(DNA)

# object_size will print the number of bytes that a given object is using in your R session
library(magrittr)
sapply(ls(), function(x) object.size(get(x))) %>% sort %>% tail(5)
# we used object.size because at the time object_size throws an error for certain types of objects.

# when you no longer need certain objects, remove them
mem_used()
rm(check_tracks, ext_tracks)
mem_used()

# mem_change allows you to view the change in memory usage by executing an R expression
mem_change(rm(x, i, x))

# 1.8.1

# When reading in large dataset or creating large R objects, it's often useful to do a back of the envelope calculation of how much memory the object will occupy in the R session
# in most 64 bit systems today:
# integers are 32 bits (4 bytes), double-precision floating point numbers (numerics in R) are 64 bits (8 bytes).

# ex: we can see that for a zero-length vector, that still requires some memory to represent the data structure.
object_size(integer(0))

# For longer vectors, the overhead stays roughly constant, and the size of the object is determined by the number of elements.
object_size(integer(1000))  ## 4 bytes per integer
object_size(numeric(1000))  ## 8 bytes per numeric

# If you are reading tabular data of integers and floating point numbers, you can roughly estimate the memory requirements for that table by multiplying the number of rows by the memory required for each of columns.
# .Machine object in R (found in base package) can give you specific details about how your computer/operation system stores different types of data.
str(.Machine)

# the floating point representation of a decimal number contains a set of bits representing the exponent and another set of bits representing the significand or the mantissa.

# 1.8.2

# the gc function in the base package can be used to explicitly trigger a garbage collection in R.
gc()

# used column gives you the amount of memory currently being used by R.
# gc trigger column gives you the amount of memory that can be used before a garbage collection is triggered
# max used column shows the maximum space used
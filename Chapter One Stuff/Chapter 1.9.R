# 1.9

# Learning objectives of this section are to:
# Read and manipulate large datasets

# 1.9.1

# data.table package can help you read a large dataset into R and explore it more efficiently.
# fread function in this package, for example, can read large flat files in much more quickly than comparable base R packages.
# use the zika data

library(data.table)
brazil_zika <- fread("data/COES_Microcephaly-2016-06-25.csv")
head(brazil_zika, 2)
class(brazil_zika)

# select argument can read in columns you want. takes a vector of either names or positions of the columns
fread("data/COES_Microcephaly-2016-06-25.csv",
      select = c("location", "value", "unit")) %>%
  dplyr::slice(1:3)

# nrows can help see if you set all of the arguments before reading in the full dataset


# can use data.table to convert a data frame into a data.table object.
# many functions in data.table use non-standard evaluation.
# you'll want to opimize your code when working with datasets that are large, but can still fit in-memory.
# R packages have been written that help you R code in parallel, either locally or on a cluster.

# 1.9.2

# DBI package interfaces R code with a database management system.
# DBI package allows you to use the same commands for working with database-stored data in R.
# DBI packages depends on lower-level R packages to translate its generic commands to work for specific database management systems.

# some packages allow yiou to write R code that uses other software to load and work with data through an Rn API provided by the other software.

# 1.2

# Learning objectives for this section are to:
# Define tidy data and to transform non-tidy data into data
# a tidy data set has the following properties:
# Each variable forms a column, each observation forms a row, and each type of observational unit forms a table.
# Example of the tidy format

library(tidyr)
library(dplyr)

VADeaths %>%
  tbl_df() %>%
  mutate(age = row.names(VADeaths)) %>%
  gather(key, death_rate, -age) %>% 
  separate(key, c("urban", "gender"), sep = " ") %>%
  mutate(age = factor(age), urban = factor(urban), gender = factor(gender))

View(iris)
# just playing around and testing this out
fooboo <- iris %>%
  tbl_df() %>%
  gather(key, inches, -Species) %>%
  separate(key, c("flower", "measurement"), remove = TRUE) %>%
  mutate(flower = factor(flower), measurement = factor(measurement))

# 1.2.1

# these collection of packages is sometimes referred to as the tidyverse because of their dependence on and presumption of tidy data.
# "Tidyverse" packages include the following:
# ggplot2 which is a plotting system based on the grammer of graphics
# magrittr which defines the %>% operator for chaining functions together in a series of operations on data.
# dplyr which is a suit of (fast) functions for working with data frames
# tidyr: easily tidy data with spread() and funcitions
# tidyverse package can be installed by using this:
library(tidyverse)

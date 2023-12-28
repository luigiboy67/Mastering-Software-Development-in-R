# 1.3

# Learning objectives for this section are to: 
# Read tabular data into R and read in web data via web scraping tools and APIs

# The readr package is the primary means by which we will read tablular data, most notably, comma-separated-value (CSV) files.
# read_csv function in readr builds on that by removing some of the quirks and gotchas of read.csv as well as dramatically optimizing the speed with which it can read data into R.
# read_csv function also adds some nice user-oriented features like a progress meter and a compact method for specifying column types.

library(readr)
teams <- read_csv("STAT 330/beanie.csv")

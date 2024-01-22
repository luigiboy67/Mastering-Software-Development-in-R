# 2.2

# The learning objectives of the section are:
# Write a function that abstracts a single concept/procedure

# when writing R functions, one has to consider the following things:
# functions are used to encapsulate a sequence of expressions that are executed together to achieve a specific goal.
# There is going to be a user who will desire the ability to modify certain aspects of your code to match their specific needs or application.

# 2.2.1

# for example, consider the following code that operates on download logs published by RStudio from their mirror of the comprehensive R archive network (CRAN).
library(readr)
library(dplyr)

## Download data from RStudio (if we haven't already)
if(!file.exists("data/2016-07-20.csv.gz")) {
  download.file("http://cran-logs.rstudio.com/2016/2016-07-20.csv.gz", 
                "data/2016-07-20.csv.gz")
}
cran <- read_csv("data/2016-07-20.csv.gz", col_types = "ccicccccci")
cran %>% filter(package == "filehash") %>% nrow

# a few aspects of this code that one might want to modify or expand on:
# the date: code only reads data for July 20, 2016. What about data from other days?
# the package: this code only returns the number of downloads for the filehash package.

# once you've identified which aspects of a block of code you might want to modify or vary, we can take those things and abstracts them to be arguments of a function.

# 2.2.2

# following function has two arguments:
# pkgname, the name of the package as a character string
# date, a character string indicating the date for which you want download statistics, in year-month-day format

# here's the function
library(dplyr)
library(readr)

## pkgname: package name (character)
## date: YYYY-MM-DD format (character)
num_download <- function(pkgname, date) {
  ## Construct web URL
  year <- substr(date, 1, 4)
  src <- sprintf("http://cran-logs.rstudio.com/%s/%s.csv.gz",
                 year, date)
  
  ## Construct path for storing local file
  dest <- file.path("data", basename(src))
  
  ## Don't download if the file is already there!
  if(!file.exists(dest))
    download.file(src, dest, quiet = TRUE)
  
  cran <- read_csv(dest, col_types = "ccicccccci", progress = FALSE)
  cran %>% filter(package == pkgname) %>% nrow
}

# Now you can call the function using whatever date or package name you choose.
num_download("filehash", "2016-07-20")

# We can look up the downloads for a different package on a different day.
num_download("Rcpp", "2016-07-19")

# 2.2.2.1
# by setting a default value, if an argument is not explicitly set by the user, the function can use the default value.
# ex:
num_download <- function(pkgname, date = "2016-07-20") {
  year <- substr(date, 1, 4)
  src <- sprintf("http://cran-logs.rstudio.com/%s/%s.csv.gz",
                 year, date)
  dest <- file.path("data", basename(src))
  if(!file.exists(dest))
    download.file(src, dest, quiet = TRUE)
  cran <- read_csv(dest, col_types = "ccicccccci", progress = FALSE)
  cran %>% filter(package == pkgname) %>% nrow
}

# 2.2.2.2

# this function adds a bit of error checking to see if download.file() was successful or not
check_for_logfile <- function(date) {
  year <- substr(date, 1, 4)
  src <- sprintf("http://cran-logs.rstudio.com/%s/%s.csv.gz",
                 year, date)
  dest <- file.path("data", basename(src))
  if(!file.exists(dest)) {
    val <- download.file(src, dest, quiet = TRUE)
    if(!val)
      stop("unable to download file ", src)
  }
  dest
}

# num_download() is somewhat simpler():
num_download <- function(pkgname, date = "2016-07-20") {
  dest <- check_for_logfile(date)
  cran <- read_csv(dest, col_types = "ccicccccci", progress = FALSE)
  cran %>% filter(package == pkgname) %>% nrow
}  

# 2.2.2.3

# we can write a separate function to check that the packages are installed
check_pkg_deps <- function() {
  if(!require(readr)) {
    message("installing the 'readr' package")
    install.packages("readr")
  }
  if(!require(dplyr))
    stop("the 'dplyr' package needs to be installed first")
}

# require returns TRUE or FALSE depending on whether the package can be loaded or not.

# updated function for package dependencies:
num_download <- function(pkgname, date = "2016-07-20") {
  check_pkg_deps()
  dest <- check_for_logfile(date)
  cran <- read_csv(dest, col_types = "ccicccccci", progress = FALSE)
  cran %>% filter(package == pkgname) %>% nrow
}

# 2.2.2.4


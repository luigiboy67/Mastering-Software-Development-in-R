# 1.4

# The learning objectives for this section are to:
# Read in web data via web scraping tools and APIs

# 1.4.1

# Simpliest way to read web-based data is if the data ia available online as a flat file.
# Couple clues: no formatting, just looks like you opened a file in a text editor on your own computer.
# It will often have a web address that ends with a typical flat file extension.

# By creating an R object with the filepath to the file, you can use the paste0 function to paste pieces of the web address together:
ext_tracks_file <- paste0("http://rammb.cira.colostate.edu/research/",
                          "tropical_cyclones/tc_extended_best_track_dataset/",
                          "data/ebtrk_atlc_1988_2015.txt")

# Next step is defining the width of each column, so that R will know where to split between columns.
# We'll use the read_fwf function from readr package to read the file into our R session.
# Since the data has "-99" for missing data, we'll use the na argument in read_fwf

library(readr)

# Create a vector of the width of each column
ext_tracks_widths <- c(7, 10, 2, 2, 3, 5, 5, 6, 4, 5, 4, 4, 5, 3, 4, 3, 3, 3,
                       4, 3, 3, 3, 4, 3, 3, 3, 2, 6, 1)

# Create a vector of column names, based on the online documentation for this data
ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day",
                         "hour", "year", "latitude", "longitude",
                         "max_wind", "min_pressure", "rad_max_wind",
                         "eye_diameter", "pressure_1", "pressure_2",
                         paste("radius_34", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_50", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_64", c("ne", "se", "sw", "nw"), sep = "_"),
                         "storm_type", "distance_to_land", "final")

# Read the file in from its url
ext_tracks <- read_fwf(ext_tracks_file, 
                       fwf_widths(ext_tracks_widths, ext_tracks_colnames),
                       na = "-99")
ext_tracks[1:3, 1:9]

# The fwf_empty function in the readr package guesses the widths of columns based on the positions of empty columns.
# You can use some dplyr functions to check out the dataset once it's in R like this:

library(dplyr)

ext_tracks %>%
  filter(storm_name == "KATRINA") %>%
  select(month, day, hour, max_wind, min_pressure, rad_max_wind) %>%
  sample_n(4)

# you can aslo read in flat lines from secure urls (https).

# here's an example from github:

zika_file <- paste0("https://raw.githubusercontent.com/cdcepi/zika/master/",
                    "Brazil/COES_Microcephaly/data/COES_Microcephaly-2016-06-25.csv")
zika_brazil <- read_csv(zika_file)

zika_brazil %>%
  select(location, value, unit)

# 1.4.2

# API stands for "Application Program Interface"; They provide rules for software applications to interact.
# For R users, APIs provide rules you need to know to write R code to request and pull data from the organizations's web server into your R session.

# Basic steps for accessing and using data from a web API when working in R are:
# Figure out the API rules for HTTP requests.
# Write R code to create a request in the proper format
# Send the request using GET or POST HTTP methods
# Once you get back data from the request, parse it into an easier-to-use format if necessary.

# To get the data from an API, first read the organization's API documentation.
# Many organizations will rewuire you to get an API key and use this key in each of your API requests.
# API keys should be kept private
# You can save your API key to a file name .Renviron in the home directory. The file should be a plain text file and must end in a blank line.

# The riem package is an excellent example of how you can use R to pull open data through a web API.
# The package allows you to pull weather data from airports around the world directly from the Iowa Environmental Mesonet.
# Once we know the rules, we can submit an HTTP GET request using the GET function from the httr package.

# When using GET or POST functions from the httr oackage, you include the key-value pairs for any query parameters as a list object in the query argument of the function.
# Here's an example:
library(httr)
meso_url <- "https://mesonet.agron.iastate.edu/cgi-bin/request/asos.py/"
denver <- GET(url = meso_url,
              query = list(station = "DEN",
                           data = "sped",
                           year1 = "2016",
                           month1 = "6",
                           day1 = "1",
                           year2 = "2016",
                           month2 = "6",
                           day2 = "30",
                           tz = "America/Denver",
                           format = "comma")) %>%
  content() %>% 
  read_csv(skip = 5, na = "M") 

denver %>% slice(1:3)

# content call in this code extracts the content from the response to the http request sent by the GET function.
# There are other packages for API data such as twitter, rnoaa, Quandl, RGoogleAnalytics, censusr, acs, WDI, wbstats, GuardianR, rdian, blsAPI, rtimes, dataRetrieval, waterdata.'

# 1.4.3

# You can also use R to pull and clran web-based data that is not accessible through a web API or as an online flat file.
# The rvest package is a good entry point for handling more complex collection and cleaning of web-based data.
# Look up the rvest Github README.


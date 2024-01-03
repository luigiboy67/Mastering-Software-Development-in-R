# 1.5

# Learning Objectives
# Transform nontidy data into tidy data
# Manipulate and transform a variety of data types, including dates, times, and text data.

# This section will use the ext_tracks hurricane dataset.
library(readr)

ext_tracks_file <- "data/ebtrk_atlc_1988_2015.txt"
ext_tracks_widths <- c(7, 10, 2, 2, 3, 5, 5, 6, 4, 5, 4, 4, 5, 3, 4, 3, 3, 3,
                       4, 3, 3, 3, 4, 3, 3, 3, 2, 6, 1)
ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day",
                         "hour", "year", "latitude", "longitude",
                         "max_wind", "min_pressure", "rad_max_wind",
                         "eye_diameter", "pressure_1", "pressure_2",
                         paste("radius_34", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_50", c("ne", "se", "sw", "nw"), sep = "_"),
                         paste("radius_64", c("ne", "se", "sw", "nw"), sep = "_"),
                         "storm_type", "distance_to_land", "final")
ext_tracks <- read_fwf(ext_tracks_file, 
                       fwf_widths(ext_tracks_widths, ext_tracks_colnames),
                       na = "-99")

# 1.5.1

# The piping concept is straight forward - the pipe passes the data frame output that resulets from the function right before the pipe to input it as the first argument of the function right adter the pipe.
# Example:
# Without piping
library(tidyr)
library(dplyr)
function(dataframe, argument_2, argument_3)
  
  # With piping
  dataframe %>%
  function(argument_2, argument_3)
    
# You could create new R objects at each step, but your adding to the memory and making the code cluttered.
katrina <- filter(ext_tracks, storm_name == "KATRINA")
katrina_reduced <- select(katrina, month, day, hour, max_wind)
head(katrina_reduced, 3)    

# You could put everything in at once, but that's still too cluttered.
head(select(filter(ext_tracks, storm_name == "KATRINA"),
            month, day, hour, max_wind), 3)
# With piping, it makes it less cluttered.
ext_tracks %>%
  filter(storm_name == "KATRINA") %>%
  select(month, day, hour, max_wind) %>%
  head(3)

# 1.5.2

# Summarize function inputs a data frame and creates a new data frame with the requested summaries.

# Example:
ext_tracks %>%
  summarize(n_obs = n(),
            worst_wind = max(max_wind),
            worst_pressure = min(min_pressure))
# This summary is useful because it gives an unrealistic value for minimum pressure, meaning we need to clean the data.

# You call also use summarize with functions you've written yourself.

knots_to_mph <- function(knots){
  mph <- 1.152 * knots
}

ext_tracks %>%
  summarize(n_obs = n(),
            worst_wind = knots_to_mph(max(max_wind)),
            worst_pressure = min(min_pressure))

# You can use the group_by function to group your data frame by one of its column variables
ext_tracks %>%
  group_by(storm_name, year) %>%
  head()

# If a data frame is grouped, all summaries are calculated and given separately for each unique value of the grouping varirable.
ext_tracks %>%
  group_by(storm_name, year) %>%
  summarize(n_obs = n(),
            worst_wind = max(max_wind),
            worst_pressure = min(min_pressure))

# Here's a plot using group_by and summarize
library(ggplot2)
ext_tracks %>%
  group_by(storm_name) %>%
  summarize(worst_wind = max(max_wind)) %>%
  ggplot(aes(x = worst_wind)) + geom_histogram() 

# If you get this error: Error: cannot modify grouping variable, use ungroup to remove the grouping within a data frame.

# 1.5.3

# By using the select function, you can subset certain columns of a data frame
ext_tracks %>%
  select(storm_name, month, day, hour, year, latitude, longitude, max_wind)

# You can use starts_with inside of the select function to get columns that start with that text.
ext_tracks %>%
  select(storm_name, latitude, longitude, starts_with("radius_34"))

# Ends _with selects columns that end with a string
# Contains selects columns that includes a certain string
# Matches selects all columns that match a certain relative expression

# filter picks out certain rows. It uses a lot of logical operators.
# ==, !=, >, >=, <, <=, %in%, is.na() are R operators

# Here are some examples of R logical statements:
head(ext_tracks$hour)
head(ext_tracks$hour == "00")

# 

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

# when using logical statements with filter, it just returns whatever is true:
ext_tracks %>% 
  select(storm_name, hour, max_wind) %>%
  head(9)

ext_tracks %>%
  select(storm_name, hour, max_wind) %>%
  filter(hour == "00") %>%
  head(3)

# filter can also be done after summarizing:
ext_tracks %>%
  group_by(storm_name, year) %>%
  summarize(worst_wind = max(max_wind)) %>%
  filter(worst_wind >= 160)

# you can also use the | and & operators as well
ext_tracks %>%
  select(storm_name, month, day, hour, latitude, longitude, max_wind) %>%
  filter(storm_name == "ANDREW" & max_wind >= 137)

# 1.5.4

# mutate function can add, or change columns in the data frame.
# lets use the worldcup dataset from faraway
library(faraway)
data(worldcup)

# since the players names are row numbers, let's put this in its own category:
worldcup <- worldcup %>%
  mutate(player_name = rownames(worldcup))

worldcup %>% slice(1:3)

# you can use mutate in coordination with group_by to create new columns that gives summaries within certain windows of the data.
worldcup <- worldcup %>% 
  group_by(Position) %>%
  mutate(ave_shots = mean(Shots)) %>%
  ungroup()

worldcup %>% slice(1:3)

# use the rename function to rename a column
worldcup %>% 
  rename(Name = player_name) %>%
  slice(1:3)

# 1.5.5

# we'll use VADeaths again for this section.
data("VADeaths")
head(VADeaths)

# the gather function gather values spread across several columns into a single column, with the column names gathered into a "key" column.
# use a minus sign to exclude columns
data("VADeaths")
library(tidyr)

# Move age from row names into a column
VADeaths  <- VADeaths %>%
  tbl_df() %>%
  mutate(age = row.names(VADeaths)) 
VADeaths

# Gather everything but age to tidy data
VADeaths %>%
  gather(key = key, value = death_rate, -age)

# gather is occasionally useful for pulling data together to take advantage of faceting, or plotting separate plots based on a grouping variable.
library(tidyr)
library(ggplot2)
worldcup %>%
  select(Position, Time, Shots, Tackles, Saves) %>% 
  gather(Type, Number, -Position, -Time) %>%
  ggplot(aes(x = Time, y = Number)) + 
  geom_point() + 
  facet_grid(Type ~ Position)

# spread function can be useful for creating summary tables.
library(knitr)

# Summarize the data to create the summary statistics you want
wc_table <- worldcup %>% 
  filter(Team %in% c("Spain", "Netherlands", "Uruguay", "Germany")) %>%
  select(Team, Position, Passes) %>%
  group_by(Team, Position) %>%
  summarize(ave_passes = mean(Passes),
            min_passes = min(Passes),
            max_passes = max(Passes),
            pass_summary = paste0(round(ave_passes), " (", 
                                  min_passes, ", ",
                                  max_passes, ")")) %>%
  select(Team, Position, pass_summary)

# What the data looks like before using `spread`
wc_table

# Use spread to create a prettier format for a table
wc_table %>%
  spread(Position, pass_summary) %>%
  kable()
# in the spread call, you first specify the name of the column to use for the new column names, then specify the column to use for the cell values
# kable creates the summary table in a table format, rather than a basic R format.

# 1.5.6

# we'll use team_standings.csv file and the world standings dataset for joining data frames
team_standings <- read_csv("data/team_standings.csv")
team_standings %>% slice(1:3)

# main arguments for the *_join functions are the object names of the two data frames to join and by, which specifies which variables to use to match up observations from the two dataframes.
# Example
world_cup <- worldcup
left_join(world_cup, team_standings, by = "Team")

# example of merging with dplyr functions 
data(worldcup)
worldcup %>% 
  mutate(Name = rownames(worldcup),
         Team = as.character(Team)) %>%
  select(Name, Position, Shots, Team) %>%
  arrange(desc(Shots)) %>%
  slice(1:5) %>%
  left_join(team_standings, by = "Team") %>% # Merge in team standings
  rename("Team Standing" = Standing) %>%
  kable()

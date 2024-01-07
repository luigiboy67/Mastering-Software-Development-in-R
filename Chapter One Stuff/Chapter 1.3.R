# 1.3

# Learning objectives for this section are to: 
# Read tabular data into R and read in web data via web scraping tools and APIs

# The readr package is the primary means by which we will read tablular data, most notably, comma-separated-value (CSV) files.
# read_csv function in readr builds on that by removing some of the quirks and gotchas of read.csv as well as dramatically optimizing the speed with which it can read data into R.
# read_csv function also adds some nice user-oriented features like a progress meter and a compact method for specifying column types.

library(readr)
teams <- read_csv("data/team_standings.csv")

cols(
  Standing = col_double(),
  Team = col_character()
)

teams
# You can also specidy the type of each column with the col_types argument.

teams <- read_csv("data/team_standings.csv", col_types = "cc")
teams

# The read_csv function will also read compressed files automatically.
logs <- read_csv("data/2016-07-19.csv.gz", n_max = 10)

── Column specification ────────────────────────────────────────────────────────
cols(
  date = col_date(format = ""),
  time = col_time(format = ""),
  size = col_double(),
  r_version = col_character(),
  r_arch = col_character(),
  r_os = col_character(),
  package = col_character(),
  version = col_character(),
  country = col_character(),
  ip_id = col_double()
)

logs <- read_csv("data/2016-07-20.csv.gz", col_types = "ccicccccci", n_max = 10)
logs

# You can specify the column type in a more detailed fashion by using the various col_* functions.

logdates <- read_csv("data/2016-07-20.csv.gz", 
                     col_types = cols_only(date = col_date()),
                     n_max = 10)
logdates

# read_csv progress option provides a progress meter while the csv file is being read.

# readr function           Use
# read_csv                 Reads comma-separated file
# read_csv2                Reads semicolon-separated file
# read_tsv                 Reads tab-separated file
# read_delim               General function for reading delimited files
# read_fwf                 Reads fixed width files
# read_log                 Reads log files
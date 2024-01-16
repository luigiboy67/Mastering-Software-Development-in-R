# 1.7

# learning onjectives for this section are to:
# Transform non-tidy data into tidy data
# Manipulate and transform a variety of data types, including dates, times, and text data.

# 1.7.1

# you can bine things using the paste function
paste("Square", "Circle", "Triangle")

# you can insert a different string between each word by specifying the sep argument:
paste("Square", "Circle", "Triangle", sep = "+")

# you can use paste0 as a shortcut:
paste0("Square", "Circle", "Triangle")

# you can provide a vector strings as an argument to paste()
shapes <- c("Square", "Circle", "Triangle")
paste("My favorite shape is a", shapes)


two_cities <- c("best", "worst")
paste("It was the", two_cities, "of times.")

# you can collapse all of the elements of a vector of strings into a single string using the collapse argument
paste(shapes, collapse = " ")

# nchar function counts the number of characters in a string:
nchar("Supercalifragilisticexpialidocious")

# toupper and tolower makes upper and lower case letters.
cases <- c("CAPS", "low", "Title")
tolower(cases)
toupper(cases)

# 1.7.2

# a regular expression is a string that defines a pattern that could be contained within another string.
# meta characters are characters that describe other characters

# grepl function takes a regular expression (like a pattern) and string to be searched
regular_expression <- "a"
string_to_search <- "Maryland"

grepl(regular_expression, string_to_search)

# in the above example, since a is in maryland, the expression returns true

regular_expression <- "u"
string_to_search <- "Maryland"

# this will return false because u is not found anywhere in maryland
grepl(regular_expression, string_to_search)

# here are some more examples:

grepl("land", "Maryland")
grepl("ryla", "Maryland")
grepl("Marly", "Maryland")
grepl("dany", "Maryland")

# lets look at the head of a dataset named state.name
head(state.name)

# by looking at the . metacharacter, it represents any character other than a new line.
grepl(".", "Maryland")
grepl(".", "*&2[0+,%<@#~|}")
grepl(".", "")

# let's look at another example.
grepl("a.b", c("aaa", "aab", "abb", "acadb"))

# in the above example, the function returns true if the pattern a is followed by any character followed by b.

# + metacharacter indicates that one or more of the preceding rxpression should be preesent.
# * metacharacter indicates that zero or more of the preceding expression is present.

# Does "Maryland" contain one or more of "a" ?
grepl("a+", "Maryland")

# Does "Maryland" contain one or more of "x" ?
grepl("x+", "Maryland")

# Does "Maryland" contain zero or more of "x" ?
grepl("x*", "Maryland")

# {} metacharacter specifies exact number of expressions using curly brackets.

# Does "Mississippi" contain exactly 2 adjacent "s" ?
grepl("s{2}", "Mississippi")

# This is equivalent to the expression above:
grepl("ss", "Mississippi")

# Does "Mississippi" contain between 1 and 3 adjacent "s" ?
grepl("s{1,3}", "Mississippi")

# Does "Mississippi" contain between 2 and 3 adjacent "i" ?
grepl("i{2,3}", "Mississippi")

# Does "Mississippi" contain between 2 adjacent "iss" ?
grepl("(iss){2}", "Mississippi")

# Does "Mississippi" contain between 2 adjacent "ss" ?
grepl("(ss){2}", "Mississippi")

# Does "Mississippi" contain the pattern of an "i" followed by 
# 2 of any character, with that pattern repeated three times adjacently?
grepl("(i.{2}){3}", "Mississippi")

# the () in the last three examples are capturing group, which allows you to use quantifiers on other regular expressions.

# words "\\w" specify any letter, digit, or an underscore
# digits "\\d" specify the digits 0 through 9
# whitespace "\\s" specifies line breaks, tabs, or spaces

# "\\W" does what "\\s" does
# "\\D" just specify a through z
# "\\S" does what "\\w" does
grepl("\\w", "abcdefghijklmnopqrstuvwxyz0123456789")
grepl("\\d", "0123456789")
# "\n" is the metacharacter for a new line
# "\t" is the metacharacter for a tab
grepl("\\s", "\n\t   ")

grepl("\\d", "abcdefghijklmnopqrstuvwxyz")

grepl("\\D", "abcdefghijklmnopqrstuvwxyz")

grepl("\\w", "\n\t   ")

# you can also specify specific character sets using []
# you can find the complement to a specific character by putting a ^ after the first bracket.
# you can also specify ranges of characters using a - inside the brackets
grepl("[aeiou]", "rhythms")
grepl("[^aeiou]", "rhythms")
grepl("[a-m]", "xyz")
grepl("[a-m]", "ABC")
grepl("[a-mA-M]", "ABC")

# \\ and a metacharacter indicates you are looking for that character in a string
grepl("\\+", "tragedy + time = humor")
grepl("\\.", "http://www/jhsph.edu/")

# "^"and "$" are metacharacters for matching the beginning and the end of a string
grepl("^a", c("bab", "aab"))
grepl("b$", c("bab", "aab"))
grepl("^[ab]+$", c("bab", "aab", "abc"))

# "|" metacharacter matches either the regex on the left or the right of this character.
grepl("a|b", c("abc", "bcd", "cde"))
grepl("North|South", c("South Dakota", "North Carolina", "West Virginia"))

# with state.name dataset
start_end_vowel <- "^[AEIOU]{1}.+[aeiou]{1}$"
vowel_state_lgl <- grepl(start_end_vowel, state.name)
head(vowel_state_lgl)

state.name[vowel_state_lgl]

# 1.7.3

# grepl stands for grep logical
grepl("[Ii]", c("Hawaii", "Illinois", "Kentucky"))

# grep() returns the indices of the vector that match the regex
grep("[Ii]", c("Hawaii", "Illinois", "Kentucky"))

# sub function takes as arguments a regex, a "replacement", and a vector of strings.
# this function will replace the first instance of that regex found in each string
sub("[Ii]", "1", c("Hawaii", "Illinois", "Kentucky"))

# gsub same as sub except it will replace every instance of the regex that is matched in each string.
gsub("[Ii]", "1", c("Hawaii", "Illinois", "Kentucky"))

# strplit function will split up strings according to the provided regex.
# if strplit is provided with a vector of strings it will return a list of string vectors
two_s <- state.name[grep("ss", state.name)]
two_s
strsplit(two_s, "ss")

# 1.7.4

# stringr package is part of the tidyverse group of R packages.
# usually the string is the first argument and the regex is the second argument. 
# usually start with str_

# str_extract() function returns the sub-string of a string that matches the provided regular expression
library(stringr)
state_tbl <- paste(state.name, state.area, state.abb)
head(state_tbl)

str_extract(state_tbl, "[0-9]+")

# str_order function returns a numeric vector that corresponds to the alphabetical order of the strings in the provided vector.
head(state.name)
str_order(state.name)

head(state.abb)
str_order(state.abb)

# str_pad function pads strings with other characters which is often useful when the string is going to be eventually printed for a person to read.
str_pad("Thai", width = 8, side = "left", pad = "-")
str_pad("Thai", width = 8, side = "right", pad = "-")
str_pad("Thai", width = 8, side = "both", pad = "-")

# str_to_title function acts just puts into title case
cases <- c("CAPS", "low", "Title")
str_to_title(cases)

# str_trim function deletes whitespaces from both sides of a string
to_trim <- c("   space", "the    ", "    final frontier  ")
str_trim(to_trim)

# str_wrap inserts newlines in strings so when string is printed, each line's length is limited.
pasted_states <- paste(state.name[1:20], collapse = " ")

cat(str_wrap(pasted_states, width = 80))
cat(str_wrap(pasted_states, width = 30))

# word function allows you to index each word in a string as if it were a vector.
a_tale <- "It was the best of times it was the worst of times it was the age of wisdom it was the age of foolishness"

word(a_tale, 2)
word(a_tale, end = 3)
word(a_tale, start = 11, end = 15)

# 1.7.5

# string manipulation in R is useful for data cleansing, plus it can be fun.
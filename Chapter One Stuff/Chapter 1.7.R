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

# {} metacharacter specifies exact numbers of expressions using curly brackets.

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


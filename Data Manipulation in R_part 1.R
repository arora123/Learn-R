# Contents:
#   Long & Wide data fromat
#   pipe operator (%>%)
#   gather(); spread(), separate(); unit() functions from tidyr

#__________________________________________________________________________________________________________
# References:
# https://rpubs.com/bradleyboehmke/data_wrangling
# http://blog.rstudio.org/2014/07/22/introducing-tidyr/
#http://rpackages.ianhowson.com/cran/tidyr/man/separate.html

# ________________________________________________________________________________________________________
# Data Manipulation
# 
# It is often said that 80% of data analysis is spent on the process of cleaning and preparing the data. (Dasu and Johnson, 2003)
# 
# Well, structured data serves two purposes:
#   
#   1. Makes data suitable for software processing whether that be mathematical functions, visualization, etc.
#   2. Reveals information and insights
# 
# Why Use tidyr & dplyr
# 1. Although many fundamental data processing functions exist in R, they have been a bit convoluted to date and have lacked consistent coding and 
# the ability to easily flow together → leads to difficult-to-read nested functions and/or choppy code.
# 2. As a result, a lot of data processing tasks are becoming packaged in more cohesive and consistent ways → leads to:
#   More efficient code
#   Easier to remember syntax
#   Easier to read syntax
# ______________________________________________________________________________________________________

#The two most important properties of tidy data are:

# 1. Each column is a variable.
# 2. Each row is an observation.
# ______________________________________________________________________________________________________
# Commonly used packages for data manipulation:
#   
# tidyr by Hadley Wickham (Data Manipulation in R_part 1)
# dplyr by Hadley Wickham (Data Manipulation in R_part 2)
# 
# _________________________________________________________________________________________________________
# Useful functions & operators:
#   pipe operator (%>%)
#   gather(); spread(); saparate(); unit() from tidyr
#   select(); filter(); group_by(); summarise(); arrange(); join(); mutate() from dplyr

__________________________________________________________________________________________________________
# To install and load packages:
  
install.packages("tidyr"); library(tidyr)


#_____________________________________________________________________________________________________________________________

# pipe operator (%>%)
# This operator will forward a value, or the result of an expression, into the next function call/expression. 
# Example1
# For instance a function to filter data can be written as:
#   filter(data, variable == numeric_value)
# or
#   data %>% filter(variable == numeric_value)
# 
# Example2
# To filter some data, summarize it, and then order the summarized results we would write it out as:
  
1. Nested Option:
  
  arrange(
    summarize(
      filter(data, variable == numeric_value),
      Total = sum(variable)
    ),
    desc(Total)
  )


or 

2. Multiple Object Option:
  
  a <- filter(data, variable == numeric_value)
b <- summarise(a, Total = sum(variable))
c <- arrange(b, desc(Total))


or 

3. Using pipe operator (%>%) Option:
  
  data %>%
  filter(variable == “value”) %>%
  summarise(Total = sum(variable)) %>%
  arrange(desc(Total))

____________________________________________________________________________________________
# learning tidyr
# The fundamental functions are: gather(); spread(); saparate(); unit()
#   
# gather() takes multiple columns, and gathers them into key-value pairs (2 columns_key column & value column):
# Key column contains former column names (we give a new name to this column) &
# Value column contains former column values (we give a new name to this column)
#   
# Other names for gather include melt (reshape2), pivot (spreadsheets) and fold (databases)  
# Objective: Reshaping wide format to long format
# 
# Description: There are times when our data is considered unstacked and a common attribute of concern is spread out across columns. To reformat the data such that these common attributes are gathered together as a single variable, the gather() function will take multiple columns and collapse them into key-value pairs, duplicating all other columns as needed.
# 
# Complement to: spread()
# 
# Function:       gather(data, key, value, ..., na.rm = FALSE, convert = FALSE)
# Same as:        data %>% gather(key, value, ..., na.rm = FALSE, convert = FALSE)
# 
# Arguments:
#   data:           data frame
# key:            column name representing new variable
# value:          column name representing variable values
# ...:            names of columns to gather (or not gather)
# na.rm:          option to remove observations with missing values (represented by NAs)
# convert:        if TRUE will automatically convert values to logical, integer, numeric, complex or 
# factor as appropriate
# 
# Example1: Polution level
# 
# To create a data frame for weekly polution data (pm level for four cities in India for the Jan 2016)  

wide_data1 = data.frame(c("Delhi", "Mumbai", "Hyderabad", "Pune"), c(267.5, 243.2, 68.3, 109.7), c(273, 282.2, 70, 117.3), c(289.2, 278.5, 69.3, 112.7),  c(293.4, 282.5, 71.3, 122.7))
colnames(wide_data1)=c("City", "Week.1", "Week.2", "Week.3", "Week.4")

# This data is in wide format. It shows 4 obs for 5 variables where last four variables represent the "Week" from value "1to4"
# Corresponding long format will contain 2 variables (City and Week) and 16 observations
# To get long format we use gather function

long_data1 = gather(wide_data1, "Week", "pm_level", 2:5)

# ALternate way (doble quotes are not required)
wide_data1 %>% gather(wide_data1, "Week", "pm_level", 2:5)
long_data1 = gather(wide_data1, "Week", "pm_level", Week1:Week4)
long_data1 = gather(wide_data1, "Week", "pm_level", -City)
long_data1 = gather(wide_data1, "Week", "pm_level", Week1, Week2, Week3, Week4)



#Example2:Heart rate
e’ve given three patients two different drugs and recorded their heart rate (heart rate of patients for two groups of drug a & b):
wide_data2<- data.frame(name = c("Rajat", "Sahil", "Sumit"), a.1 = c(65, 78, 62), b.2 = c(54, 88, 48))

# To make data tidy for statistical analysis, we need all three variables (patient_names, drug, heart_rate ) in columns and obs in rows
# We can gather the a and b columns into key-value pairs of drug and heartrate using gather()

long_data2 <- wide_data2 %>% gather(drug, heart_rate, a.1:b.2)


#Example3: Student's score
# e’ve given five student's score in two different subjects (maths, stats): 

wide_data3<- data.frame(student_name = c("Amit", "Jatin", "Rajat", "Sahil", "Sumit"), Maths_1 = c(89, 78, 56, 45, 62), Stats_2 = c(79, 83, 61, 52, 68))

# To make data tidy for statistical analysis, we need all three variables (student_names, subject, score) in columns and obs in rows
# We can gather the Maths and Stats columns into key-value pairs of subject and score using gather()

long_data3 <- wide_data3 %>% gather(subject, score, -student_name)


#Example4:
set.seed(1) # To make results reproducible
wide_data4 <- data.frame(
  id = 1:4,
  trt = sample(rep(c('control', 'treatment'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

long_data4 <- wide_data4 %>% gather(key, time, -id, -trt)
____________________________________________________________________________________________________

# spread() takes two columns (key & value) and spreads in to multiple columns
# Objective: Reshaping long format to wide format
# Description: There are times when we are required to turn long formatted data into wide formatted data. The spread() function spreads a key-value pair across multiple columns.
# 
# Complement to: gather()
# 
# Function:       spread(data, key, value, fill = NA, convert = FALSE)
# Same as:        data %>% spread(key, value, fill = NA, convert = FALSE)
# 
# Arguments:
#   data:           data frame
# key:            column values to convert to multiple columns
# value:          single column values to convert to multiple columns' values 
# fill:           If there isn't a value for every combination of the other variables and the key 
# column, this value will be substituted
# convert:        if TRUE will automatically convert values to logical, integer, numeric, complex or 
# factor as appropriate
# 
# Example1:
wide_data11= spread(long_data1, Week, pm_level)
#Note: This data frame is same as the original dataframe wide_data BUT now City names are ordered alphabatically

#Example2: If we are interested to see the difference between heart rates of patients for each drug group

wide_data21 <- long_data2 %>% spread(drug, heart_rate)

#Example3: Student's score
wide_data31 <- long_data3 %>% spread(subject, score)

#Example4:
wide_data41 <- long_data4 %>% spread(key, time)
_________________________________________________________________________________________________________
# separate() splits a single column into multiple columns
# Objective: Splitting a single variable into two
# 
# Function:       separate(data, col, into, sep = " ", remove = TRUE, convert = FALSE)
# Same as:        data %>% separate(col, into, sep = " ", remove = TRUE, convert = FALSE)
# 
# Arguments:
# data:           data frame
# col:            column name representing current variable
# into:           names of variables representing new variables
# sep:            how to separate current variable (char, num, or symbol)
# remove:         if TRUE, remove input column from output data frame
# convert:        if TRUE will automatically convert values to logical, integer, numeric, complex or 
# factor as appropriate
# 
# Example1
# In the long format data (long_data), we want to make 2 saparate variables for "Week variable"
# named "Time_interval" and "Interval_ID"

separate_data1 = separate(long_data1, Week, into=c("Time_interval", "Interval_ID"))

#Example2:

# In the long format data (long_data), we want to make 2 saparate variables for "drug variable"
# named "Drug_type" and "Drug_ID"
#does't make much sense but just for practice

separate_data2 = separate(long_data2, drug, into=c("Drug_type", "Drug_ID"))

#Example3:

separate_data3 = separate(long_data3, subject, into=c("subject_name", "type"))

#Example4:

separate_data4 = separate(long_data4, key, into=c("location", "time"))

#More Examples:
df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df %>% separate(x, c("A", "B"))

# If every row doesn't split into the same number of pieces, use
# the extra and file arguments to control what happens
df <- data.frame(x = c("a", "a b", "a b c", NA))
df %>% separate(x, c("a", "b"))
# The same behaviour but no warnings
df %>% separate(x, c("a", "b"), extra = "drop", fill = "right")
# Another option:
df %>% separate(x, c("a", "b"), extra = "merge", fill = "left")

# If only want to split specified number of times use extra = "merge"
df <- data.frame(x = c("x: 123", "y: error: 7"))
df %>% separate(x, c("key", "value"), ": ", extra = "merge")




#____________________________________________________________________________________
# unite() combines multiple columns into a single column
# 
# Objective: Merging two variables into one
# 
# Description: There may be a time in which we would like to combine the values of two variables. The unite() function is a convenience function to paste together multiple variable values into one. In essence, it combines two variables of a single observation into one variable.
# 
# Complement to: separate()
# 
# Function:       unite(data, col, ..., sep = " ", remove = TRUE)
# Same as:        data %>% unite(col, ..., sep = " ", remove = TRUE)
# 
# Arguments:
# data:           data frame
# col:            column name of new "merged" column
# ...:            names of columns to merge
# sep:            separator to use between merged values
# remove:         if TRUE, remove input column from output data frame
# 
# Example1:
# Using the separate_data dataframe we created above, we can re-unite the Time_interval and Interval_ID variables we created and 
# re-create the original Week variable we had in the long_data dataframe.

unite_data1 <- separate_data1 %>% unite(Week, Time_interval, Interval_ID, sep = "  ")
 
# We can use different separators like '_' or "  "
unite_data1 <- separate_data1 %>% unite(Week, Time_interval, Interval_ID, sep = "_")
unite_data1 <- separate_data1 %>% unite(Week, Time_interval, Interval_ID, sep = "  ")

#Example2:
unit_data2 <- unite(separate_data2, drug, Drug_type, Drug_ID, sep = ".")


#Example3:
unit_data3 <- unite(separate_data3, subject, subject_name, type, sep = "_")


#Example4:
unit_data <- unite(separate_data4, key, location, time, sep = ".")


_________________________________________________________________________________________________________



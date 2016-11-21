

# Contents ----------------------------------------------------------------

## Numbers with Exponents
## In built functions in R
## Rounding a number in R
## Infinity, NA and NAN values in R
## Variable assignment in R
## simple arithmatics in R
## Atomic data types in R

# Note:
# The hashtag is used to add comments
# More than one expressions can be placed on a single line separated by semi-colons, for example
5; 7; 2-3

                            *************************************

# Numbers with Exponents
For very big numbers or very small numbers R uses the following scheme:
#1.2e3 means 1200 because the e3 means 'move the decimal point 3 places to the right' 1.2e-2 means 0.012 
#because the e-2 means 'move the decimal point 2 places to the left'
x=1.2e3
y=1.2e-1
z=2-3i
z
x
y
z
x+y
t=2+3i
z+t
z*t
z/t

## Inbuilt mathematical functions in R -----------------------------------------------------

pi; exp(1)
log(x); log(10); log(exp(1)) # log to base e of x
log10(x); log10(100) # log to base 10 of x
log(x,n); log(9, 3) # log to base n of x
sqrt(x); factorial(x); gamma(x)
choose(n,x) # Binomial coefficient nCx
lgamma(x) # natural log of gamma (x)
floor(x) # greatest integer <x
ceiling(x) # smallest integer >x
trunc(x) # closest integer to x between x and 0 trunc(1.5) =1, trunc(-1.5) =???1 
# NOTE: trunc is like floor for positive values and like ceiling for negative values
round(x, digits=0) # round the value of x to an integer
signif(x, digits=6) # give x to 6 digits in scientific notation
runif(n) # generates n random numbers between 0 and 1 from a uniform
distribution
cos(x) # cosine of x in radians
sin(x) # sine of x in radians
tan(x) # tangent of x in radians
acos(x), asin(x), atan(x) # inverse trigonometric transformations of real or complex numbers
acosh(x), asinh(x), atanh(x) # inverse hyperbolic trigonometric transformations of real or complex numbers
abs(x) # the absolute value of x, ignoring the minus sign if there is one

# Examples (see answers and warnings)
sin(pi/2); cos(pi/2)
runif(5); runif(-3)
sqrt(16); sqrt(-9); sqrt(-9+0i)
factorial(5); factorial(-2); factorial(0)
gamma(3); gamma(0.5); gamma(1.4); gamma(0); gamma(-2)
log(2); log(10); log10(10); log(0), log(Inf); log(-Inf)

# Modulo and Integer Quotients

#Integer quotients and remainders are obtained using the notation %/% (percent, divide,percent) 
# and %% (percent, percent) respectively.

# To know the integer part of a division 
17%/%3 # how many 3s are there in 17
28%/%6

# To get the reminder
17%%3
28%%6
-42%%5 # 45 = 42 +3

# Floor and Celing Function
#Rounding (rounding up, rounding down, rounding to the nearest integer)  
# The 'greatest integer less than' function is floor (??? rounding down)
floor(5.7)
floor(2.3)
floor(-1.2)

# The 'lowest integer greater than' function is ceiling (??? rounding up)
ceiling(5.7)
ceiling(2.3)
ceiling(-1.2)

# To round to the nearest integer by adding 0.5 to the number then using floor 
#(there is also an inbuilt function for tha same)
rounded<-function(x) floor(x+0.5) # By writing a new function
rounded(5.7)
rounded(2.3)
rounded(-1.2)

# Infinite values in R -----------------------------------------------------

# Plus infinity, represented in R by Inf and minus infinity is represented as -Inf
30/0
-10/0
# To evaluate calculations involving infinity
exp(Inf)
exp(-Inf)
Inf/0 # WHY Inf ???
0/Inf; 0^Inf # WHY ZERO ???
1^Inf
(0:3)^Inf
0+Inf
Inf+Inf
2^0
2^Inf
(1/2)^Inf
0.3^Inf


# NA's, NAN's and NULL in R -----------------------------------------------------


# Quantities that are not numbers (undefined mathematical operators) are represented by NaN 
#('not a number') in R
# E.g.
0/0; Inf/Inf; Inf-Inf # indeterminate form of number 

# Missing values (and indeterminate form) in R are represented by NA ('not available')

# NULL as the empty set from mathematics. NULL is special since it has no
# class (its class is NULL) and has length 0 so it does not take up any space in a vector.

# is.nan() is used to test for NaN's
# is.na() is used to test, if objects are NA's

## NOTE: A NAN value can also be NA but not conversely. 
#It means is.na also returns TRUE for NaN's
## NOTE: NA values also have a class
## NOTE: Coercing NaN to logical or integer type gives an NA of the appropriate type.

# Examples on NA and NaN values

# NA's and NAN's in R

x = c(1, 2, 4.5, NA, NA)

is.na(x)
is.nan(x)

x = c(1, 2, 4.5, NA, 4/0, 0/0)

is.nan(x)

is.na(x) # A NAN value can also be NA but not conversely. 
# It means is.na also returns TRUE for NaN's

NA + 1
sum(c(NA, 1, 2))
median(c(NA, 1, 2, 3), na.rm = TRUE)
length(c(NA, 2, 3, 4))
3 == NA
NA == NA
TRUE | NA
NaN + 1
exp(NaN)

length(c(1, 2, NULL, 4))
sum(c(1, 2, NULL, 4))
x <- NULL
y <- c(x, 2)
is.null(x); is.null(y) #The function is.null can be used to detect NULL variables

# Some functions do not work with missing values in data
x<-c(1:8,NA)
mean(x)
# To calculate mean of non-missing values
mean(x,na.rm=TRUE); mean(x,na.rm=T) # By removing Na values

# To check for the location of missing values within a vector
vmv<-c(1:6,NA,NA,9:12)
vmv
which(is.na(vmv))
seq(along=vmv)[is.na(vmv)] # Alternate way

# To assign some value, say zero, to missing values of the vector 'vmv'
vmv[is.na(vmv)]<- 0
vmv

# To assign different values to missing values of the vector 'vmv'
vmv[is.na(vmv)]<- c(1,2) # NOTE square bracket
vmv

# Alternate way of replacing NA values (by using ifelse)
vmv<-c(1:6,NA,NA,9:12)
ifelse(is.na(vmv),0,vmv)
vmv


# More Example
vector = c(1:3, NA, 4, NA, 4:1)
vector
is.na(vector)
is.nan(vector)
which(is.na(vector))
#vector[is.na(vector)] = 0
vector[is.na(vector)] = c("NEW", -8)
vector

# To check whether a number is finite or infinite
is.finite(10)
is.infinite(10)
is.infinite(Inf)


# Variable assignment in R -----------------------------------------------------

# Assign the value 42 to x
x <- 42; x = 42
# Logical Operators
x < -42; x > -42; 
x = 20; # It reassigns value 20 to x
x <= 20; x >=20; x!=20; x!=15; x == 20 

x <- c(T, T, F, F); y <- c(T, F, T, F); z <- c(1, 0, 1, 0)
x&y; x|y
x&z; x|z # z is coerced to logical vector automatically

x <- 1:20; x # To create a sequence 1 2 3 .... 20
x = 5:1; x; x = 1:-2; x; x = -3:1; x

# Print out the value of the variable x

print (x) # To explicitly print value of x
x # Simple way to print x/ To auto print the value of x

## Some simple airthmatic operations
# + - */%% ^ arithmetic
# > >= < <= == != relational
# ! & | logical
# ~ model formulae
# <- -> assignment
# $ list indexing (the 'element name' operator)
# : create a sequence

# An addition
5 + 5

# A substraction
5 - 5

# A multiplication
3 * 5

# A division
(5 + 5)/2

# Exponentiation
2^5

# More examples

1:25
2*1:4
n<-5
1:n-1
(n-1):1 
6:1
6+12



# Assign the value 5 to the variable called my_apples
my_apples <- 5
# Print out the value of the variable my_apples
my_apples

# Assign a value to the variables called my_apples and my_oranges
my_apples <- 5
my_oranges <- 6
# Add these two variables together and print the result
my_fruit = my_apples + my_oranges
# Create the variable my_fruit
my_fruit

# Basic data types in R -----------------------------------------------------

# numeric Numeric data (approximations of the real numbers, ℝ)
# integer Integer data (whole numbers, ℤ)
# factor Categorical data (simple classifications, like gender)
# ordered Ordinal data (ordered classifications, like educational level)
# character Character data (strings)
# raw Binary data

# Character, Numeric sometimes called double, Integer, Complex, Logical

my_character <- "forty-two" # The quotation marks indicate that the variable is of type character
my_numeric <- 42.3
my_integer = 23L
my_complex = 2-3i
my_logical <- FALSE

# To check the class of variables
# Assign the data type
datatype1=class(my_character)
datatype2=class(my_numeric)
datatype3=class(my_integer)
datatype4=class(my_complex)
datatype5=class(my_logical)

# Print the types
datatype1
datatype2
datatype3
datatype4
datatype5

# simply use class(my_numeric)

class(42.3L); class(42.3); class(23); class(23L); class(0); class(0L) # See warning msg in first example
class(pi); class(piL) # PiL is not any object in R
class(0/0); class(5/0); class(Inf)   # Special number: Inf, nan











































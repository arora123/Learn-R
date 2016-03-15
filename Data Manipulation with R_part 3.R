# Functions & Operators used:
# Data Manipulation with R_Part 3
#_____________________________________________________________

# Package used:

# data.table by M Dowle et al (Data Manipulation in R_part 3)

#_____________________________________________________________

# To install and load packages:

install.packages("data.table"); library(data.table) 

# To load & view pre-installed r data set

data('iris'); fix(iris) 

#_____________________________________________________________

iris = data.table(iris)

iris[2:5, ]
iris[2:5, 2:4]
iris[Species == 'versicolor']
iris[Petal.Length  %in% c('1.4', '1.5')] # To select all columns for which Petal length is 1.4 or 1.5
iris[ , .(Petal.Length, Petal.Width)] # To select multiple columns
iris[ , c(Petal.Length, Petal.Width)] # Note the difference
iris[ , Petal.Length] # To select a column and return as a vector
iris[2:5, Petal.Length] # To select a columns for few rows and return as a vector
iris[ ,sum(Petal.Length, na.rm=TRUE)] # To get sum of a column
iris[ ,.(mean(Petal.Length, na.rm=TRUE), sd(Petal.Length, na.rm=TRUE))] # To get mean and sd
iris[ ,{
  print(Sepal.Width)
  plot(Petal.Width)
  
}]    # To print and plot


iris[ , .(mean(Sepal.Length)), by = Species] # To find mean of a variable for groups of other


setkey(iris, Species) # To select a column for computation by setting key on the column
iris['setosa'] # To select rows associatedd with 'setosa' species

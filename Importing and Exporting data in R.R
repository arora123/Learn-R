
###############################################################################################

# Importing & Exporting data

###############################################################################################


# To import data files into R ---------------------------------------------

# Make sure to set your working directory

# To import Text data file in R
myTEXTdata = read.table("mydata.txt“, header = TRUE)

# To import CSV data file in R

myCSVdata <- read.table("c:/mydata.csv", header=TRUE, sep=",", row.names="id")

# Note the / instead of \ on Windows systems

myCSVdata = read.csv("mydata.csv") # Alternate Way

#To import Excel data file in R
# Read in the first worksheet from the workbook 'myexcel.xlsx' 
# first row contains variable names

library(xlsx); mydata <- read.xlsx("c:/myexcel.xlsx", 1)

# Read in the worksheet named 'mysheet'

mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")


# Alternate Way

library(readxl); mydata <- read_excel("c:/myexcel.xlsx", sheet =1)
mydata <- read_excel("c:/myexcel.xlsx", sheet = "mysheet")

# To import SPSS data file in R

library(foreign); mySPSSdata <- read.spss("Housing Pricing Data.sav“)
# If SPSS dataset is in trasport format

library(Hmisc); mySPSSdata <- spss.get("c:/mydata.por", use.value.labels=TRUE)

#To import SAS data file in R

install.packages("sas7bdat"); library(sas7bdat)
mySASdata <- read.sas7bdat("d1.sas7bdat")

# If SAS dataset is in trasport format

library(Hmisc); mySASdata <- sasxport.get("c:/mydata.xpt") # character variables are converted to R factors

#To import STATA data file in R

install.packages(“foreign"); library(foreign)
mySTATAdata <- read.dta("D://Learning//Learn R//R_programming data and codes//sales.dta")


# Export data from R ------------------------------------------------------

#To export R data file to a tab delimited text file

write.table(mydata, "c:/mydata.txt", sep="\t")

#To export R data file CSV format

write.csv(MyData, file = "MyData.csv")

write.table(MyData, file = "MyData.csv",row.names=FALSE, na="",col.names=FALSE, sep=",")

#To export R data file to an Excel spreadsheet

library(xlsx); write.xlsx(mydata, "c:/mydata.xlsx")

To export R data file to SPSS

# Write out text data file and  an SPSS program to read it

library(foreign); write.foreign(mydata, “D:/mydata.txt", D:/mydata.sps", package="SPSS")

#To export R data file to SAS

# Write out text datafile and  an SAS program to read it

library(foreign); write.foreign(mydata, "c:/mydata.txt", "c:/mydata.sas", package="SAS")


#To export R data file to STATA

# Export data frame to Stata binary format

library(foreign); write.dta(mydata, "c:/mydata.dta")

write(Results," D:/ Learning / MyResults2.txt")
write(Results," D:/ Learning / MyResults2.txt", ncolumns=2)















x = c(4,6,4,2,4)
y = 3*x+5
z = data.frame(x,y)
write.table(z, "D:/mydata.txt", sep="\t")
write.csv(z, "D:/mydata.csv")
library(xlsx)
write.xlsx(z, "D:/mydata.xlsx")
m=lm(y~x)
s = summary(m)
write.xlsx(m, "D:/output.xlsx")
capture.output(s, file = "summary")


# Export output
df<-data.frame("a"=rnorm(10), "b"=rnorm(10), "c"=rnorm(10))
output<-apply(X=df, MARGIN=2,FUN=summary)
write.table(output, file="output.csv", dec=",", sep=";")

save.image("D:/LearnR.RData")
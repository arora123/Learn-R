# Data Visualization with R
## Treemapping using R


install.packages("treemap")

library(treemap)


# Example-1 ---------------------------------------------------------------


data = read.csv("D://Learning//Learn R//R_programming data and codes//exp_income.csv")

#To create a treemap (separate in order of gender, name and exp_level, rectangle size based on income)

treemap(data, index = c('Gender', 'Name', 'Exp.Level'), vSize = 'Income')

# To assign a position to labels for gender, name and exp_level

labelAlign = list(c('left', 'center'), c('left', 'top'), c('right', 'bottom'))

treemap(data, index = c('Gender', 'Name', 'Exp.Level'), vSize = 'Income', 
        align.labels = labelAlign)


# To give a title and font size to tree map

treemap(data, index = c('Gender', 'Name', 'Exp.Level'), vSize = 'Income', title = 'Income by exp_level & Gender',
        fontsize.title = 30, fontsize.labels = c(14, 11, 11),
        align.labels = labelAlign)

?treemap


######################################################################################


# Example-2 ---------------------------------------------------------------


data = read.csv("D://Learning//Learn R//R_programming data and codes//myskill.csv")

treemap(data, index = c('Tools', 'Statistical.Techniques'), vSize = 'Proficiency')

labelAlign = list(c('left', 'top'), c('right', 'bottom'))

treemap(data, index = c('Tools', 'Statistical.Techniques'), vSize = 'Proficiency', title = 'Proficiency by Tools & Techniques',
        fontsize.title = 30, fontsize.labels = c(14, 12),
        align.labels = labelAlign)







## R Programming Quiz 1, Q11:
#load quiz data
getwd()
file <- file.path('quiz1_data','hw1_data.xls') 
data <- read.csv('hw1_data.csv')
#Q11 In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)
# Q12 Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
data[1:2,]
# Q13. How many observations (i.e. rows) are in this data frame?
nrow(data)
dim(data)
# Q14. Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
data[152:153,]
tail(data,2)
# Q15. What is the value of Ozone in the 47th row?
data[47,]$Ozone
data$Ozone[47]

# Q16. How many missing values are in the Ozone column of this data frame?
sum(as.numeric(is.na(data$Ozone) ))

ozone_data <- data[,1]
length(ozone_data[is.na(ozone_data)])
# Q17 Question 17 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone)
newdf <- data[complete.cases(data$Ozone),] 
mean(newdf$Ozone)
        
ozone_clean <- ozone_data[!is.na(ozone_data)]
mean(ozone_clean)


# Q18 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset
df1 <- data[data$Ozone > 31,] 
df2 <- df1[df1$Temp > 90,] 
is.na(df2$Solar.R)
newdf2 <- df2[complete.cases(df2$Solar.R),]
mean(newdf2$Solar.R)

mean(na.omit(df2)$Solar.R) 
# Q 19 What is the mean of "Temp" when "Month" is equal to 6?
df3 <- data[data$Month == 6,]
is.na(data[data$Month == 6,])
mean(df3$Temp)
# Q 20 What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
df4 <- data[data$Month == 5,]
max(df4$Ozone,na.rm = TRUE)

data.May <- data[data$Month == 5, , drop = FALSE]
data.May_ <- na.omit(data.May)
max(data.May_$Ozone)

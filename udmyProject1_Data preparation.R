getwd()

fin0 <- read.csv('Future-500.csv')
str(fin0)
sum(complete.cases(fin0))
fin <- read.csv('Future-500.csv',na.string=c(''))#a character vector of strings which are to be interpreted as NA values. 
sum(complete.cases(fin))
head(fin0[!complete.cases(fin0),],13)
head(fin[!complete.cases(fin),],13)
?read.csv

fin[!complete.cases(fin),]
str(fin)
dim(fin)
typeof(fin)
summary(fin)
head(fin)
#change from non-factor to factor
fin$ID <- factor(fin$ID)
summary(fin)
fin$Inception <- factor(fin$Inception)
fin$Growth
#replace data
fin$Expenses <- gsub(' Dollars','',fin$Expenses)
fin$Expenses
fin$Expenses <- gsub(',','',fin$Expenses)
fin$Revenue <- gsub('\\$','',fin$Revenue)
fin$Revenue <- gsub(',','',fin$Revenue)
fin$Growth <- gsub('\\%','',fin$Growth)
str(fin)
#change data type
fin$Growth <- as.numeric(fin$Growth)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
str(fin)
#Mising value
complete.cases(fin)
fin[!complete.cases(fin),]
head(fin[!complete.cases(fin),],13)
#<NA> vs. NA  empty in csv  is not equal to NA, eg. #10 row should has NA value,  to fix missing NA, read.csv(na.string=c(' '))
#which to find non-missing data,eg
which(fin$Profit == 8701897)
fin[which(fin$Profit == 8701897),]
is.na(fin)
is.null(fin) #False
 #remove /replacing missing data
fin_backup <- fin
fin <- fin_backup
dim(fin_backup)
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),]
dim(fin)
rownames(fin) <- 1:nrow(fin)
rownames(fin)
rownames(fin) <- NULL
rownames(fin)
is.na(fin) 
#fin[is.na(fin),]
nrow(fin)
fin[!complete.cases(fin),]
fin[is.na(fin$State) & fin$City == "New York",]
fin[is.na(fin$State) & fin$City == 'New York', 'State'] <-'NY'
fin[c(11,377),]
fin[is.na(fin$State) & fin$City == 'San Francisco', 'State'] <- 'CA'
fin[!complete.cases(fin),]
#Imputation
median(fin[,'Employees'])
median(fin[,'Employees'],na.rm=TRUE)
mean(fin[,'Employees'],na.rm=TRUE)
median(fin[fin$Industry == 'Retail','Employees'],na.rm=TRUE)
media_empl_retail <- median(fin[fin$Industry == 'Retail','Employees'],na.rm=TRUE)
fin[is.na(fin$Employees),]
fin[is.na(fin$Employees) & fin$Industry =='Retail',]
fin[is.na(fin$Employees) & fin$Industry =='Retail', 'Employees'] <- media_empl_retail

mean(fin[fin$Industry == 'Financial Services','Employees'],na.rm=TRUE)
media_empl_financial <- median(fin[fin$Industry == 'Financial Services','Employees'],na.rm=TRUE)
fin[is.na(fin$Employees) & fin$Industry =='Financial Services', 'Employees'] <- media_empl_financial
fin[is.na(fin$Employees),]
fin[!complete.cases(fin),]

mean(fin[fin$Industry == 'Construction','Growth'],na.rm=TRUE)
media_growth_Construction <- median(fin[fin$Industry == 'Construction','Growth'],na.rm=TRUE)
fin[is.na(fin$Growth) & fin$Industry =='Construction', 'Growth'] <- media_growth_Construction
fin[is.na(fin$Growth),]
fin[!complete.cases(fin),]

mean(fin[fin$Industry == 'Construction','Revenue'],na.rm=TRUE)
media_contr_Revenue <- median(fin[fin$Industry == 'Construction','Revenue'],na.rm=TRUE)
fin[is.na(fin$Revenue) & fin$Industry =='Construction', 'Revenue'] <- media_contr_Revenue
fin[is.na(fin$Revenue),]
fin[!complete.cases(fin),]

mean(fin[fin$Industry == 'Construction','Expenses'],na.rm=TRUE)
media_contr_Expenses <- median(fin[fin$Industry == 'Construction','Expenses'],na.rm=TRUE)
media_contr_Expenses
# add filter to make assure the replace exactly the rows you want
fin[is.na(fin$Expenses) & fin$Industry =='Construction',]
fin[is.na(fin$Expenses) & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & fin$Industry =='Construction' & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & fin$Industry =='Construction', 'Expenses'] <- media_contr_Expenses
fin[is.na(fin$Expenses),]
fin[!complete.cases(fin),]

# Profit = Revenue - Expense   Expense =  Profit + Revenue
fin[is.na(fin$Profit),]
fin[is.na(fin$Profit),'Revenue']-fin[is.na(fin$Profit),'Expenses']
# big problem because of minor erro fin[is.na(fin$Profit),] <- fin[is.na(fin$Profit),'Revenue']-fin[is.na(fin$Profit),'Expenses']
fin[is.na(fin$Profit),'Profit'] <- fin[is.na(fin$Profit),'Revenue']-fin[is.na(fin$Profit),'Expenses']
fin[!complete.cases(fin),]

fin[is.na(fin$Expenses),]
fin[is.na(fin$Expenses),'Revenue'] + fin[is.na(fin$Expenses),'Profit']
# big problem because of minor erro fin[is.na(fin$Profit),] <- fin[is.na(fin$Profit),'Revenue']-fin[is.na(fin$Profit),'Expenses']
fin[is.na(fin$Expenses),'Expenses'] <- fin[is.na(fin$Expenses),'Revenue'] + fin[is.na(fin$Expenses),'Profit']
fin[!complete.cases(fin),]

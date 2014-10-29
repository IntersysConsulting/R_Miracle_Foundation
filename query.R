##################################################################################################################
#########  Intersys Consulting                                                                               #####
#########  Miracle Foundation                                                                                #####
#########  World Health Organization                                                                         #####
#########  Last modified on 10/17/2014     -     Developed using R version 3.0.1 (2013-05-16)                #####
#########  This code corcerns the calculation of prevalences using all valid z-scores (non-missing)          #####
#########  for three indicators: weight-for-age (5 to 10 years), height-for-age (5 to 19 years) and BMI-for- #####
#########  age (5 to 19 years) based on the WHO 2007 references.                                             #####
#########  Exact age must be given in months (no rounding necessary), height in centimeters and weight in    #####
#########  kilograms.                                                                                        #####
##################################################################################################################
##################################################################################################################

objectName <- "Medical_Record__c"
fields <- c("Id", "Weight_kg__c", "Height_cm__c", "Gender__c", "Age_at_Measurement_Yrs__c")
wfawho2007<- read.table("C:/Users/aaron/Documents/MiracleFoundation/who2007_R/wfawho2007.txt", header=T,sep="",skip=0)
hfawho2007<- read.table("C:/Users/aaron/Documents/MiracleFoundation/who2007_R/hfawho2007.txt", header=T,sep="",skip=0)
bfawho2007<- read.table("C:/Users/aaron/Documents/MiracleFoundation/who2007_R/bfawho2007.txt", header=T,sep="",skip=0)
bmi <- array(dim=c(100,1))
zscore <- array(dim=c(100,1))

options(repos=structure(c(CRAN="http://cran.revolutionanalytics.com")))
source("MiracleFoundation/login.R")
source("MiracleFoundation/who2007_R/who2007.R")
children = rforcecom.retrieve(session, objectName, fields, limit=NULL, id=NULL, offset=NULL, order=NULL, inverse=NULL, nullsLast=TRUE)

data <- rbind(children)
data = data[rowSums(is.na(data)) == 0,]
data$Gender__c <- as.character(data$Gender__c)
data$Gender__c[data$Gender__c == "Male"] <- 1
data$Gender__c <- as.factor(data$Gender__c)
data$Gender__c <- as.character(data$Gender__c)
data$Gender__c[data$Gender__c == "Female"] <- 2
data$Gender__c <- as.factor(data$Gender__c)
data$Age_at_Measurement_Yrs__c <- as.numeric(as.character(data$Age_at_Measurement_Yrs__c))*12
colnames(data)[5] <- "Age_at_Measurement_Months__c"
data$Weight_kg__c <- as.numeric(as.character(data$Weight_kg__c))
data$Height_cm__c <- as.numeric(as.character(data$Height_cm__c))

who2007(FilePath="C:/Users/aaron/Documents/MiracleFoundation/", mydf=data,sex=Gender__c,age =Age_at_Measurement_Months__c,weight=Weight_kg__c, height=Height_cm__c)


setwd("C:/Users/aaron/Documents/MiracleFoundation")
library(MASS)

y = [5,5]
x = [22,44]
boxcox(y~x)
install.packages ("RForcecom")
library(RForcecom)

//Sign in to Force.com or Salesforce.com
username <- "jimg@miraclefoundation.org.test"
password <- "Miracle2468"
instanceURL <- "https://test.salesforce.com/"
apiVersion <- "27.0"
(session <- rforcecom.login(username, password, instanceURL, apiVersion))

//Retrieving records
objectName <- "Account"
fields <- c("Id", "Name", "Phone")
rforcecom.retrieve(session, objectName, fields)

//Execute a SOQL
soqlQuery <- "SELECT Id, Name, Phone FROM Account WHERE AnnualRevenue > 50000 LIMIT 5"
rforcecom.query(session, soqlQuery)

//Create a record
objectName <- "Account"
fields <- c(Name="R Analytics Service Ltd", Phone="5555-5555-5555")
rforcecom.create(session, objectName, fields)

//Retrieve a server timestamp
rforcecom.getServerTimestamp(session)
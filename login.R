install.packages ("RForcecom")
options(repos=structure(c(CRAN="http://cran.revolutionanalytics.com")))
library(RForcecom)
username <- "jimg@miraclefoundation.org.test"
password <- "Miracle2468NQOYQ9MUOB8jWV3bFGFm5WR0"
instanceURL <- "https://cs14.salesforce.com/"
apiVersion <- "27.0"
(session <- rforcecom.login(username, password, instanceURL, apiVersion))

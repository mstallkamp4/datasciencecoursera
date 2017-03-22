## Setup
##setwd("C:/github/datasciencecoursera/rprogramming/ProgrammingAssignment3")
##getwd()

#1.  Plot the 30-day mortality rates for heart attack
## Read the file
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#Learn a little bit about the file structure
head(outcome)
str(outcome)

#Get column and row counts
ncol(outcome)
nrow(outcome)

#Pull the data in two different ways into variables
outcome[, 11] <- as.numeric(outcome[, 11])
outcome11alt <-as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)

outcome11
outcome11alt

#Histogram of the 30 day death rate Mortailty from heart attack
hist(outcome[, 11])

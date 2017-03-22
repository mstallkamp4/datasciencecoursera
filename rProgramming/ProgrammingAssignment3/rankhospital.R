source("best.R")


rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    ValidStates <- file$State == state
    EligibleRows <- file[ValidStates, ]
    colnum <- switch(outcome,
                     Pneumonia = 23,
                     HeartAttack = 11,
                     HeartFailure = 17)
    NAs <- EligibleRows[ , colnum]!="Not Available"
    EligibleRows <- EligibleRows[NAs, ]
    
    if (nrow(EligibleRows)==0 )
    {
        stop("Invalid state")
    }
    
    if  (length(colnum)==0 )
    {
        stop("Invalid Outcome")
    }

    ## Return hospital name in that state with the given rank
    Ranked <- EligibleRows[ order(as.numeric(EligibleRows[ ,colnum]), EligibleRows[ ,2]), ]
    
    if (num=="best")
    {
        num <-1
    }
    if (num=="worst")
    {
        num <-nrow(Ranked)
    }
    
    Ranked[num, 2]
   
}

rankhospital("MD", "HeartAttack", "worst")
rankhospital("NC", "HeartAttack", "worst")

rankhospital("WA", "HeartAttack", 7)
rankhospital("TX", "Pneumonia", 10)


rankhospital("NY", "HeartAttack", 7)
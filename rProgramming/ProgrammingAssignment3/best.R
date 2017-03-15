

#2. Finding the best hospital in a state

best <- function(state, outcome) {
    ##Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    ValidStates <- file$State ==state
   
    EligibleRows <- file[ValidStates, ]
    colnum <- switch(outcome,
                     Pneumonia = 23,
                     HeartAttack = 11,
                     HeartFailure = 17)
    
    if (nrow(EligibleRows)==0 )
       {
        stop("Invalid state")
    }
    
    if  (length(colnum)==0 )
    {
        stop("Invalid Outcome")
    }
    
   vals <- which(as.numeric(EligibleRows[, colnum])==min(as.numeric(EligibleRows[, colnum]), na.rm=TRUE))


   EligibleRows[vals, 2]    ## Return Hospital name in that state with lowest 30-day death rate

    

}


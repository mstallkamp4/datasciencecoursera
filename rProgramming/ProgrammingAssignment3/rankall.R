getwd()


rankall <- function(outcome, num = "best") {
    ##Initialize List
    States <- list()
    ##Define a function to help us with ranking states
    RankByState <-function(State, Outcome)
    {
        statecolnum <- switch(Outcome,
                              Pneumonia = 23,
                              HeartAttack = 11,
                              HeartFailure = 17)
        
        ValidStates <- file$State == State
        StateRows <- file[ValidStates, ]
        Ranked <- StateRows[ order(as.numeric(StateRows[ ,colnum]), StateRows[ ,2]), ]
        cbind("Outcome"=Ranked[,statecolnum], "StateName"=Ranked[ ,7], "HospitalName"=Ranked[,2],"rank"=seq.int(nrow(Ranked)))
    }
    
    
    ## Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    colnum <- switch(outcome,
                     Pneumonia = 23,
                     HeartAttack = 11,
                     HeartFailure = 17)
    NAs <- file[ , colnum]!="Not Available"
    EligibleRows <- EligibleRows[NAs, ]
    
    if (nrow(EligibleRows)==0 )
    {
        stop("Invalid state")
    }
    
    if  (length(colnum)==0 )
    {
        stop("Invalid Outcome")
    }
    
    ## For each state, find the hospital of the given rank
    
    EStates <- as.list(unique(EligibleRows$State))
    EStates
    Unfiltered <-sapply(EStates, RankByState, Outcome="Pneumonia")
    UnfilteredMatrix<-(do.call(rbind, lapply(Unfiltered, data.frame, stringsAsFactors=FALSE)))
    
    filter(UnfilteredMatrix, as.numeric(rank) < 10)
    
    
    
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
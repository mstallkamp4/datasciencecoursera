


x <- rnorm(10,20,2)

x
rapply()

rapply(x, order)



    ## Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    ValidStates <- file$State == "TX"
    
    colnum <- 17
    NAs <- EligibleRows[ , colnum]!="Not Available"
    EligibleRows <- file[NAs, ]
    States <- list()
    EStates <- as.list(unique(EligibleRows$State))
    States
    
    
    
    head(file)
    
    EligibleRows
    
    test <- order(as.numeric(EligibleRows[, 17]))==1
    which (test=="TRUE"
    which (EligibleRows$Hospital.Name=="FORT DUNCAN MEDICAL CENTER")
    test
    
    dd[ order(-dd[,4], dd[,1]), ]
    
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
    
    EStates
    Unfiltered <-sapply(EStates, RankByState, Outcome="HeartFailure")
    UnfilteredMatrix<-(do.call(rbind, lapply(Unfiltered, data.frame, stringsAsFactors=FALSE)))
    
    UnfilteredMatrix
    
    filter(UnfilteredMatrix, as.numeric(rank) < 10)
    Unfiltered[29]
    as.character(subset(UnfilteredMatrix, StateName == "HI")$HospitalName)
    
    UnfilteredMatrix    str(UnfilteredMatrix)
    as.numeric(UnfilteredMatrix$rank)
    subset(UnfilteredMatrix, )
    library(dplyr)    
    install.packages("dplyr")
    
    
    RankByState("OH", "Pneummonia")
    
    EligibleRows[42, ]
    
    
    if (nrow(EligibleRows)==0 )
    {
        stop("Invalid state")
    }
    
    if  (length(colnum)==0 )
    {
        stop("Invalid Outcome")
    }
    
    ## Return hospital name in that state with the given rank
    Ranked <- rank(as.numeric(EligibleRows[, colnum]))                        
    
    val <- which(Ranked==4)
    EligibleRows[val, 2]
    
    EStates
}

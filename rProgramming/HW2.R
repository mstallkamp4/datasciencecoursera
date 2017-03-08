   
    
    
}


setwd("C:\\GitHub\\datasciencecoursera\\rProgramming")

pollutantmean <-function(directory, pollutant, id=1:332) {
bindedset <-vector(mode="numeric")
    
if (pollutant=="sulfate")
{
    filenum<-2
}
if (pollutant=="nitrate")
{
    filenum<-3
}
    
for(i in id) 
    {

    filename <- paste("00",i, collapse="", sep="" )
    filename <-substr(filename, nchar(filename)-2, nchar(filename))
    filename
    filenamefull <- paste(directory, "\\", filename, ".csv", collapse="", sep="")


    ##used for testing
    ##print (filenamefull)

    input <- read.csv(filenamefull)

    meanset <- input[,filenum]
    bindedset <-append(bindedset, meanset)
    
    ##used for testing
    ##printedmean<-mean(meanset, na.rm=TRUE)
    
    ##used for testing 
    ##printebindeddmean<-mean(bindedset, na.rm=TRUE)
    ##print(printebindeddmean)
   
}
mean(bindedset, na.rm=TRUE)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "sulfate", 34)
test <-pollutantmean ("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate")
test

complete <-function(directory, id=1:323) {
    bindedset <-data.frame(id=numeric(), nobs=numeric())
    #print(bindedset)
    for(i in id) 
    {
        
        filename <- paste("00",i, collapse="", sep="" )
        filename <-substr(filename, nchar(filename)-2, nchar(filename))
        filenamefull <- paste(directory, "\\", filename, ".csv", collapse="", sep="")
        
        input <- read.csv(filenamefull)
        ##Read one csv to find out how to get complete records
        #input <- read.csv("specdata\\001.csv")
        #input
        ##Find the set where sulfate is not na
        goodsulfates <-!is.na(input[2])
        inputwithgoodsulfates <-(input[goodsulfates,])
        inputwithgoodsulfates
        goodnitrates <-!is.na(inputwithgoodsulfates[3])
        goodrecords <-inputwithgoodsulfates[goodnitrates,]
        #print(i)
        nobdf=data.frame(id=i, nobs=nrow(goodrecords))
        bindedset<-rbind.data.frame(nobdf, bindedset)
        #print(nobdf)
    }
   
     bindedset
}
cc<-complete("specdata", 54)
print(cc$nobs)
set.seed(42)
cc <- complete("specdata", 1:332)
use <- sample(10, 332)
print(cc[use, "nobs"])
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)


cr<-corr("specdata")
corr <-function(directory, threshold=0) {
    bindedset <-matrix
    #print(bindedset)
    for(i in 1:323) 
    {
        
        filename <- paste("00",i, collapse="", sep="" )
        filename <-substr(filename, nchar(filename)-2, nchar(filename))
        filenamefull <- paste(directory, "\\", filename, ".csv", collapse="", sep="")
        
        input <- read.csv(filenamefull)
        ##Read one csv to find out how to get complete records
        #input <- read.csv("specdata\\001.csv")
        #input
        ##Find the set where sulfate is not na
        goodsulfates <-!is.na(input[2])
        inputwithgoodsulfates <-(input[goodsulfates,])
        inputwithgoodsulfates
        goodnitrates <-!is.na(inputwithgoodsulfates[3])
        goodrecords <-inputwithgoodsulfates[goodnitrates,]
        #print(i)
        nobdf=data.frame(id=i, nobs=nrow(goodrecords))
        dfgood=data.frame(nitrate=goodrecords[2], sulfate=goodrecords[3])
        
        if (nobdf$nobs > threshold)
        {
            
            for (j in nobdf)
            {
                bindedset<-rbind()
            }
        bindedset<-rbind.data.frame(dfgood, bindedset)
        }
        y <- nrow(bindedset)
    }
    print (y)
    sulfates<-bindedset[1]
    nitrates<-bindedset[2]
    cor(bindedset)
    apply(bindedset, 1, cor)
}

cr
Summary(cr)
cr <- corr("specdata", 400)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
corr <- function(directory, threshold = 0) {
    
    
    
    ## 'directory' is a character vector of length 1 indicating
    
    ## the location of the CSV files
    
    
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    
    ## number of completely observed observations (on all
    
    ## variables) required to compute the correlation between
    
    ## nitrate and sulfate; the default is 0
    
    
    
    ## Returns a numeric vector of correlations
    
    
    
    files <- (Sys.glob("specdata//*.csv"));
    
    
    
    correlations <- c()
    
    
    
    for (file in files) {
        
        file_data <- read.csv(file, sep = ",");
        
        complete_cases <- file_data[complete.cases(file_data),];
        
        if (nrow(complete_cases) > threshold) {
            
            correlations <- c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
            
        }
        
    }
    
    
    
    return(correlations)
    
}
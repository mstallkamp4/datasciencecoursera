   
    
    
}


setwd("C:\\GitHub\\datasciencecoursera\\rProgramming")

pollutantmean <-function(directory, pollutant, id=1:322) {
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
test <-pollutantmean ("specdata", "nitrate", 23)
test

##1.682

?cbind
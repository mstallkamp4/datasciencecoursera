   
    
    
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

complete <-function(directory, id=1:322) {
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
complete("specdata", c(2,4,8,10,12))




corr <-function(directory, threshold=0) {
    bindedset <-data.frame(nitrate=numeric(), sulfate=numeric())
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
        bindedset<-rbind.data.frame(dfgood, bindedset)
        }
        y <- nrow(bindedset)
    }
    print (y)
    cor(bindedset)
}
cr<-corr("specdata")
length(cr)
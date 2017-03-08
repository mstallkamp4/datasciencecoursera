#Debugging

#Warning
log(-1)

printmessage <-function(x) {
    if(is.na(x))
        print("x is a missing value")
    if (x>0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
    #invisible removes autoprinting from console
}
printmessage(NA)
x <- log(-1)
x
printmessage(x)

#returns "x is a missing value", but it is not nA it is NAN
#something is still here

mean(x1)
traceback()

##linear model function
lm(Y1 - X1)
##error happens several levels dep
traceback()

debug(lm)
lm(y -x)

##brings up the browser
##environment is seeded with data
##type n in the console and hit enter
##this will execute line by line until error is hit


#recover
options (error=recover)
read.csv("nosuchfile")

#menu is returned, but it is the function call stack
#

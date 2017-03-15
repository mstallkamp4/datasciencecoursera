#r profiler
#don't optimize your code first off.  make it work.  make it understandable
#premature optimization is the root of all evil
#Time to optimize?  Measure, don't guess.  

system.time
#takes an arbitrary expression as input and reutrns the amount of time (in seconds)
##needed to evaluate the expression

#returns object of class proc_time
#user time:  time charged to CPU
#elapsed time:  "wall clock" time
#there will be times when either one is greater
# multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS)
# parallel processing
system.time(rnorm(100))

#elapsed time > user time
system.time(readLines(("http://www.jhsph.edu")))

#elapsed time < user time
hilbert <-function(n) {
    i <-1:n
    1 / outer(i - 1, i, "+")
}

x <-hilbert(100)

system.time(svd(x))

#timing longer expressions 

system.time({
    n <-1000
    r <-numeric(n)
    for (i in 1:n) {
        x <-rnorm(n)
        r[i] <-mean (x)
    
    }
})

#Using system.time() allows you to test certain function to see how long they take
# The problem is tha tyou need to know where the bottleneck is!

#THE R Profiler

Rprof()
#R must be compiled with profiler support (but this is usally the case)

summaryRprof()
#summarizes the output from Rprof
#DO NOT USE sys.time and Rprof together

#Rprof keeps track of the function call stack and tablulates how much time is spnt in each function
#default sampling is .02 seconds
Rprof()
lm(y~1)



set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
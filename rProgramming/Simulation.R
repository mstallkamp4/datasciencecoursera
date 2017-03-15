## Simulation

#rnorm: generate random NOrmal variates with a given mean and standard deviation

#dnorm: elvaluate the Normal probability density (with a given mean/SD)
#       at a point (or vector of points)

#pnorm: evaluatie the cumulative distribution function for a Normal distribution

#rpois:  gnerate a random Poisson variates with a given rate

#probabiltiy distibution functions that have usually four function 
# associated with them.  The functions are prefixed with 

# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

dorm(x, mean=0, sd=1, log=FALSE)
pnorm(q, mean=0, sd=1, lower.tail=TRUE, log.p=FALSE)
qnorm(p, mean=0, sd=1, lower.tail=TRUE, log.p=FALSE)
rnorm(n, mean=0, sd=1)

x <- rnorm(10)
x

x <- rnorm(10,20,2)
x

summary(x)

#Set the seed
##reproducability

set.seed(1)
rnorm(5)

rnorm(5)

set.seed(1)
rnorm(5)


##Other random variables
##Poisson distribution

#at the rate of 1
rpois(10,1)
#at the rate of 2
rpois(10,2)

#what is the probabily that a poisson random variable <=2 if the rate is 2
ppois(2,2)

ppois(4,2)

ppois(6,2)


##Simulating a linear model
#y=b0 + b1 + e 

set.seed(20)
x <-rnorm(100)
e <-rnorm(100,0,2)
y <- .5 + 2 * x +e
plot(x,y)

#What if x is binary

set.seed(10)
x <-rbinom(100,1,.5)
#generate error turn
e <-rnorm(100,0,2)

y <- .5 + 2 * x + e

plot(x,y)

#Poisson MOdel

set.seed(1)
x <-rnorm(100)
log.mu <- .5 + .3 * x
y <- rpois(100, exp(log.mu))

summary (y)

plot(x,y)

#random sampling
## The sample function draws randomly from a specified set of (scalar)
## objects allowing you to sample from arbitrary distributions

set.seed(1)

sample(1:10, 4)

sample (1:10, 4)

sample (letters, 5)

sample (1:10)

sample (1:10, replace=TRUE)

#Drawing samples from specific probability distributions can be done with r* functions
# Standard distributions are built in: normal, poisson, binomial, exponential, gamme
# The sample funciton
#  
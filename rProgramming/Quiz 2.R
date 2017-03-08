x <-c(8, 4, 0)

myfunc <- function(x) {x[1]}

myfunc(x)

y <-length(x)
x[y]

mad_libs(noun="cup", adjective="brave", place="cincinnati")

x <- 1:10
if(x > 5) {
    x <- 0
}

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}
z <- 10
f(3)



x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}
y

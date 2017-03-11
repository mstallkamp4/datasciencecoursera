#Programming Assignment 2
##Create makeInverse that has the getters and setters for the matrix

makeMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

##Calculate the inverse of the matrix unless it is cached
##If it is cached, return the cached value
cacheInverse <- function(x, ...) {
    inver <- x$getinv()
    if(!is.null(inver)) {
        print("getting cached data")
        return(inver)
    }
    inver <- solve(x$get())
    x$setinv(inver)
    inver
}

##Testing
##Create a matrix
mat <- matrix(1:4,2)

mat

MadeMatrix <-makeMatrix(mat)
## Now I can use the $ notation to view matrix
MadeMatrix$get()
## Will return null as the cacheInverse has not yet been run
cacheInverse(MadeMatrix)
##Call it again and it will
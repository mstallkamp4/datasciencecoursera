## Put comments here that give an overall description of what your
## functions do

##Create makeCacheMatrix that has the getters and setters for the Matrix
makeCacheMatrix  <- function(x = matrix()) {
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
cacheSolve <- function(x, ...) {
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

MadeMatrix <-makeCacheMatrix(mat)
## Now I can use the $ notation to view matrix
MadeMatrix$get()
##Call cacheSolve to set the inverse in cache
cacheSolve(MadeMatrix)
##Call it again and see that it is pulling from cache
cacheSolve(MadeMatrix)
##Set the matrix stored in MadeMatrix to a new Values
MadeMatrix$set(matrix(5:8,2))
##Call it again to set cache
cacheSolve(MadeMatrix)
##Verify that cache is used
cacheSolve(MadeMatrix)

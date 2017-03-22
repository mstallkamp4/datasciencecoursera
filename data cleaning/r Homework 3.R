makeCacheMatrix <- function(x = matrix()) {
    
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





## the cacheSolve will retrieve a cached version of an inverse matrix or create and cache the inverse of a matrix



cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getinv()
    
    
    
    if(!is.null(inv)) {
        
        message("The Matrix is already cached")
        
        return(inv)
        
    }
    
    
    
    data <- x$get()
    
    inv <- solve(data, ...)
    
    x$setinv(inv)
    
    inv
    
}

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

str(cacheSolve)

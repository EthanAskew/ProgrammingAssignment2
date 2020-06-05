## Pair of functions that like the examples given calculate the 
## inverse of a matrix, or gets the value from the cache

## Makes a special "vector", which is really a list containing 
##a function to

    ##set the value of the matrix
    ##get the value of the matrix
    ##set the value of the inverse
    ##get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Gets the inverse from the cache or caluates it if the value
## isn't stored

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
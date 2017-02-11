## Put comments here that give an overall description of what your
## functions do

## register set & get functions to manipulate cache
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
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

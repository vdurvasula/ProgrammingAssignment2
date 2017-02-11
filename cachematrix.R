## Put comments here that give an overall description of what your
## functions do
## steps to follow to test the functions
## input<- matrix(1:4,nrow=2,ncol=2)
## q <- makeCacheMatrix(input)
## invq <- cacheSolve(q)
## print(q) 
## register set & get functions to manipulate cache
makeCacheMatrix <- function(x = matrix()) {
## initialize variable in cache
    m <- NULL
## function to return input matrix    
    get <- function() x
## function to set cache with inverse matrix     
    setinverse <- function(inverse) m <<- inverse
## function to get inverse matrix from cache    
    getinverse <- function() m
## return list with references to functions    
    list(get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
## get inverse matrix from cache     
    m <- x$getinverse()
## check and return inverse matrix from cache    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
## get input matrix     
    data <- x$get()
## solve expression for inverse of input matrix     
    m <- solve(data, ...)
## set cache with inverse matrix    
    x$setinverse(m)
## return inverse matrix    
    m
}

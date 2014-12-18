## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function returns an object that contends four functions:
##      set
##      get
##      setinverse(inverse)
##      getinverse()
##      function get is uses later in cacheSolve calls

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
                setinverse = setinverse,
                getinverse = getinverse)
}


## Write a short comment describing this function
## this funcion receive a matrix x
## compute the inverse of the matrix using R function solve() 
## the first time, and stores the result in variable "i"
## next time it is called checks if "i" has a value (inverse of matrix 
## was already computed) and returns the inverse from "i" if already 
## there or compute it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
        return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i      
}

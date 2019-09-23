## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	  m <- NULL
##initialized 'x' as an arg; 'm' as an obj
  set <- function(aMatrix) {
    x = aMatrix
    m = NULL
  }
##assigns input 'aMatrix' to 'x' in parent env; 'm' is empty variable
  get <- function() x
## retrieve 'x'
  setinverse <- function(inverse) m <<- inverse
## sets inverse of m
  getinverse <- function() m
##  retrieves m from parent env
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
##names each element of function for future call
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
##retrieve cached inverse if available
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
##if 'null' nothing occurs; if not - returns previously cached data
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  m
##since 'null', uses solve function to find 
##the inverse of m(data) and return inverted matrix
}

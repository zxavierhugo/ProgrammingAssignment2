## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This programming is similar to the given example but I need to modify the variable in such a way that the variable inV will be the matrix.

makeCacheMatrix <- function(x = matrix()) {
  inV <- NULL ## Define the inV as empty matrix
  set <- function(y) { ## set the value of the vector
    x <<- y  ## as defined in the assignment <<- is used to assign the value to the object in an environment
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inV <<- inverse ## set the function inverse for i
  getinverse <- function() inV
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## The following function calculates the inverse of the special "vector" created with the above function. However, it first checks to see if the inverse of the matrix has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inV <- x$getinverse()
  if (!is.null(inV)) {
    message("getting cached data")
    return(inV)
  }
  data <- x$get()
  inV <- solve(data, ...)
  x$setinverse(inV)
  inV
  
  }

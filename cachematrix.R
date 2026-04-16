## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # This will hold the cached inverse
  
  # 1. Set the value of the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL # If matrix changes, clear the cache
  }
  
  # 2. Get the value of the matrix
  get <- function() x
  
  # 3. Set the value of the inverse
  setInverse <- function(inverse) inv <<- inverse
  
  # 4. Get the value of the inverse
  getInverse <- function() inv
  
  # Return the list of functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  
  # If the inverse is already calculated, return it
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, get the matrix, calculate the inverse, and cache it
  data <- x$get()
  inv <- solve(data, ...) # solve(X) calculates the inverse in R
  x$setInverse(inv)
  inv
}
## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      ## Create a matrix object
  inverse_of_x <- NULL
  set <- function(y) {
    x <<- y
    inverse_of_x <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) inv_x <<-inverse
  get_inverse <- function() inv_x
  list(set = set, get = get,
  set_inverse = set_inverse,
  get_inverse = get_inverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse_of_x <- x$get_inverse()
  if (!is.null(inv_x)) {
    message("retrieved the inverse matrix from the cache")
    return(inverse_of_x)
  } else {
    inverse_of_x <- solve(x$get())
    x$set_inverse(inverse_of_x)
    return(inverse_of_x)
  }
}
## Return a special matrix object created from a supplied matrix 
## that can calculate and cache its inverse

## Create a special matrix object from a supplied matrix that can cache a copy of its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        getinverse <- function() m
        setinverse <- function(inverse) m <<- inverse
        list(set = set, get = get,
             getinverse = getinverse,
             setinverse = setinverse)
}

## Return a cached version of the inverse of a matrix contained in makeCacheMatrix or calculate
## and store the inverse if the cache is empty
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}

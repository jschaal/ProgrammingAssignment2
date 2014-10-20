source("cachematrix.R")

performTests <- function(testNumbers = vector()) {
        allTests <- length(testNumbers) == 0
        
        if (allTests || 1 %in% testNumbers)
        {
                amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
                print(amatrix$get())         # Returns original matrix
        }
        
        if (allTests || 2 %in% testNumbers)
        {
                
                print(cacheSolve(amatrix))   # Computes, caches, and returns    matrix inverse
                print(amatrix$getinverse())  # Returns matrix inverse
        }
        
        if (allTests || 3 %in% testNumbers)
        {        
                print(cacheSolve(amatrix))   # Returns cached matrix inverse using previously computed matrix inverse
        }
        
        if (allTests || 3 %in% testNumbers)
        {        
                amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
                print(cacheSolve(amatrix))   # Computes, caches, and returns new matrix inverse
                print(amatrix$get())         # Returns matrix
                print(amatrix$getinverse())  # Returns matrix inverse
        }
        "Done"
}

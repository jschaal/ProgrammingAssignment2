source("cachematrix.R")

performTests <- function(testNumbers = vector()) {
        allTests <- length(testNumbers) == 0
        amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
        
        if (allTests || 1 %in% testNumbers)
        {
                print("Test 1")
                print(amatrix$get())         # Returns original matrix
                writeLines("")
        }
        
        cs <- cacheSolve(amatrix)
        
        if (allTests || 2 %in% testNumbers)
        {
                print("Test 2-1")                
                print(cs)   # Computes, caches, and returns    matrix inverse
                writeLines("")
                print("Test 2-2")                
                print(amatrix$getinverse())  # Returns matrix inverse
                writeLines("")
        }
        
        cs <- cacheSolve(amatrix)
        
        if (allTests || 3 %in% testNumbers) 
        {
                print("Test 3")
                print(cs)   # Returns cached matrix inverse using previously computed matrix inverse
                writeLines("")
        }
        
        amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
        cs <- cacheSolve(amatrix)
        if (allTests || 4 %in% testNumbers)
        {        
                print("Test 4-1")
                print(cs)   # Computes, caches, and returns new matrix inverse
                writeLines("")
                print("Test 4-2")
                print(amatrix$get())         # Returns matrix
                writeLines("")
                print("Test 4-3")
                print(amatrix$getinverse())  # Returns matrix inverse
                writeLines("")
        }
        "Done"
}

## Matrix inversion is usually a costly computation and there may
## be some benefit to caching the inverse of a matrix rather than 
## computing it repeatedly (there are also alternatives to matrix 
## inversion that we will not discuss here). 
## In this file, you will find a pair of functions that cache the
## inverse of a matrix.

## you can test the functions with the function named "test()"


## This function creates a special "matrix" object that can cache 
## its inverse in the variable inv.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse_) inv <<- inverse_
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then cacheSolve should retrieve 
## the inverse from the cache.
## For this assignment, we assume that the matrix supplied is always invertible.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    matrix_data <- x$get()
    inv <- solve(matrix_data)
    x$setinverse(inv)
    inv
}


## this function without any argument, create a cacheMatrix, 
## give an inversible matrix to it, then it uses the cache solves 
## function and print the result. It compares the result of the 
## stored inverse with the real inverse and print if there is a 
## success or not.
test <- function()
{
    # I create an inversible matrix a [[1 2][3 4]]. 
    a <- matrix (c(1,2,3,4), 2, 2, byrow=TRUE)
    my_matrice <- makeCacheMatrix()
    my_matrice$set(a)
    print('I set the cached matrix to : ')
    print(my_matrice$get())
    print('before the update, the inverse is : ')
    print(my_matrice$getinverse())
    cacheSolve(my_matrice)
    print('After the update, the inverse is : ')
    print(inv_mat <- my_matrice$getinverse())
    if(identical(inv_mat,solve(a)))
        print("Well done ! the cacheMarix works !")
    else
        print("It seems there is a problem in tha cacheMatrix")
}


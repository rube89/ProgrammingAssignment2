## some instructions for testing you makecacheMatrix and cacheSolve Functions
## This is from the post:" Simple test matrices for lexical scoping programming
## assignment"
## https://www.coursera.org/learn/r-programming/discussions/weeks/3/threads/ePlO1eMdEeahzg7_4P4Vvg

## R session:

## ===============================================================

## This code calculates a matrix; creates its inverse, caches it for
## future use. Then when needed, checks to see if there is cached marix 
## before recalulating it again. 

## This function inports the matrix. 
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
## intializes the parameters to Y and NULL
        x <<- y
        m <<- NULL
    }
## gets the matrix you inputted
    get <- function() x
## sets and gets the matrix then sets and gets the inverse
    setmatrix <- function(solve) m <<- solve
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}   

## cacheSolve calculates the inverse of the matrix created by the above 
## function. 

cacheSolve <- function(x, ...) {
    m <- x$getmatrix()
## checks to see if the inverse is already created, if so it messags you that
## it is getting the cached inverse matrix, it there is no invese matrix, 
## it skips this set
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
## if inverse was not cached, it calculates the inverse matrix here
    data <- x$get()
    m <- solve(data, ...)
    x$setmatrix(m)
    m
}

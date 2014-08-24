## Put comments here that give an overall description of what your
## functions do

## Since Matrix Inversion is a costly operation, these functions
## help in caching teh inverse of a matrix and return it for 
## future use

## Creates a list contain functions for
## 1. setting the matrix
## 2. getting the matrix
## 3. setting the inverse of the matrix
## 4. getting the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set<-function(matrix){
        x <<- matrix
        inv <<- NULL
    }
    get<-function() x
    
    setInv<-function(inverse) inv <<- inverse
    
    getInv<-function() inv
    
    list(set=set, get=get,
         setInv=setInv,
         getInv=getInv)


}


## Return the inverse of the matrix
## First checks to see if there is a cached value
## If not calculates the inverse and returns it
## Also caches the inverse for future use

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    m <- x$getInv()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    
    matrix<-x$get()
    m<-solve(matrix)
    x$setInv(m)
    m

}

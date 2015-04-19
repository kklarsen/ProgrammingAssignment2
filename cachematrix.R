#cachematrix.R
## This R code takes a user defined matrix a to be inverted.
## a is passed as argument to `v - makeCacheMatrix(a)`
## The inverse of the matrix a is then calculated by calling `cacheSolve(v)`
## For the same matrix a (=v) the inverse procedure is only call once after which it is retrieved from the cache.

# makeCacheMatrix Function
## This function defines and stores the matrix that shall be inverted.
## After `x` has been passed as argument to `makeCacheMatrix` one can;
## 1. `$get` retrives the matrix previously entered as an argument to the function.
## 2. `$set` allows to define a new matrix.
## Once `solveCache` has been call
## 3. `$getInverse`retrieves the inverse of the matrix x (provided that `solveCache` has been called, or `NULL` is returned)
## Note `$setInverse` function should not be called from global environment.
## It serves only to maintain the m state across the two function invocations.
## The operator `<<-` ensures that m and x states are maintained across the two functions.

makeCacheMatrix <- function(x = matrix()) {    
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        get <- function() x
        
        setInverse <- function(solve) m <<-solve
        getInverse <- function() m
        
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# `cacheSolve` Function
## This function return the Inverse of a matrix x
## using the `solve()` function, solving for b the following matrix equation
## b %% x = I with I being the identity matrix & x the matrix should should be inverted.
## Note if m = NULL then the `solve()` function is called.
## Note if m is different from NULL (i.e., `!is.null(m)`) then the solution exist in memorychache
## and will be read accordingly.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}

#Global Environment

a <- matrix(1:4, nrow = 2, ncol = 2)
v <- makeCacheMatrix(a)

print("Matrix to be inverted");print(a)
print("v$get()");print(v$get())
print("v$getInverse()");print(v$getInverse())

print("cacheSolve");print(cacheSolve(v))
print("cacheSolve");print(cacheSolve(v))
print("v$getInverse()");print(v$getInverse())


a2 <- matrix(7:10, nrow=2,ncol=2)
v$set(a2)

print("Another matrix to be inverted");print(a2)
print("v$get()");print(v$get())
print("v$getInverse()");print(v$getInverse())

print("cacheSolve");print(cacheSolve(v))
print("v$getInverse()");print(v$getInverse())
print("cacheSolve");print(cacheSolve(v))

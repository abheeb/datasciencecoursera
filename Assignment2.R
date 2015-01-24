makeVector <- function(x = matrix()) {
    m <- NULL
    print(environment()) # this should match with getevn
    env <- environment()
    print(parent.env(environment()))
    set <- function(y) {
        x <<- y
        m <<- NULL      
    }
    get <- function() x
    setmean <- function(a) m <<- a
    getmean <- function() m
    #getevn <- function() environment() # environment of set
    #get_pe <- function() parent.env(environment()) # environment of makeVector
    #get_ge <- function() parent.env(parent.env(environment())) # global environment
    list(set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) { # if False then display message and return value of m
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setmean(m)
    m
}
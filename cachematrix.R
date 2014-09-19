# The mechanism to get an invert of matrix, and cache it for next time.

## Create a matrix that is able to cache its invert.
makeCacheMatrix <- function(x = matrix()) {
    im <- NULL;

    set <- function(y) {
        x <<- y;
    }

    get <- function() {
        x;
    }

    getInverse <- function() {
        im;
    }

    setInverse <- function(m) {
        im <<- m
    }

    list(
        set = set,
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
    );

}

## Find an invert of matrix x and cache it for next time.
cacheSolve <- function(x, ...) {

    im <- x$getInverse();

    ## If cache exists, return it. Save time \0/
    if( !is.null(im) ) {
        message("getting cached data");
        return(im);
    }

    m <- x$get();

    im <- solve( m, ...)

    x$setInverse(im)

    im
}

##Programming Assignment 2

In this [second programming](https://class.coursera.org/rprog-013/human_grading/view/courses/973494/assessments/3/submissions) assignment, it is required to write an R
function that is able to cache potentially time-consuming computations.

This assignment specifically requires an R code that calculates the inverse (i.e., using `solve(x)`) of a static n-by-n matrix (i.e., non-square matrices do not have an inverse). Such an operation can be very time-consuming particular for large matrices.

The idea is, that if the content of a matrix are not changing throughout an analysis, that repeatedly require the inverted matrix, it may make more sense to cache the result of the matrix inversion, rather than repeatedly re-calculate it. In other words the result can be looked up in the cache.

This Programming Assignment will take advantage of the [lexical scoping](https://www.stat.auckland.ac.nz/~ihaka/downloads/lexical.pdf) rules of
the R language and how these can be manipulated to preserve state inside
of an R object. See also __Hadley Wickham__'s discussion of Environments in ["Advanced R"](http://adv-r.had.co.nz/Environments.html.

More details are given in the comments to the code found in `"cachematrix.R"`.

I have furthermore added some code in the the global environment that provides a simple matrix and line by line illustrates the functionality of the two functions `makeCacheMatrix` and `cacheSolve`(i.e., doing the actual matrix inversion).

Though to get the fun going you can define your own matrix __a__, feed it to `makeCacheMatix`by `v <- makeCacheMatrix(a)`. Note you would need to call the `cacheSolve`function to initiate the matrix inversion, e.g., `ai <- cacheSolve(v)`and then just to prove it works do `a1 %*% a` which should give you __I__, the unity matrix with 1's in the diagonal and zero everywhere else.

Have fun!


library(datasets)
data(iris)

?iris

iris

tapply(iris$Sepal.Length, iris$Species, mean)

rowMeans(iris[, 1:4])

apply(iris[, 1:4], 2, mean)


library(datasets)
data(mtcars)

mtcars

tapply(mtcars$cyl, mtcars$mpg, mean)

lapply(mtcars, mean)

split(mtcars, mtcars$cyl)

with(mtcars, tapply(mpg, cyl, mean))

tapply(mtcars$mpg, mtcars$cyl, mean)

apply(mtcars, 2, mean) 

sapply(split(mtcars$mpg, mtcars$cyl), mean)

sapply


debug(ls)

ls(mtcars)
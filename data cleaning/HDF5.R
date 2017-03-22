#HDF5
#HIERARCHIAL DATA FORMAT
#Stores range of data types
#Hierarchial
#groups containing zero more data sets and metadata
    # Hanve a group header with group name and list of attr
    # Have a group symbol table with a list of objects
#datasets multidimensional array of data elemetnts

source("https://bioconductor.org/biocLite.R")
?biocLite
biocLite("rhdf5")
library(rhdf5)

#create hdf5 structures
created=h5createFile("example.h5")
created

created=h5createGroup("example.h5", "foo")
created=h5createGroup("example.h5", "baa")
created=h5createGroup("example.h5", "foo/foobaa")

#hf ls
h5ls("example.h5")

#create some data sets for our hdf5 groups
#Integer Array
A=matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")

#Multi-dimensional array
B=array(seq(.1,2.0, by=.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")

h5ls("example.h5")

#Write a data set directly to the top level group
df = data.frame(1L:5L, seq(0,1, length.out=5),
                c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = FALSE)
#If no path is specified, it writes to the top level, but name is required
h5write(df, "example.h5", "df")
h5ls("example.h5")

##Reading Data
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")
readA

#Easily read and write in chunks
##WRITE THESE VALUES IN THE FIRST THREE ROWS OF THE FIRST COLUMN
h5write(c(12,13,14), "example.h5", "foo/A", index=(1:3,1))
h5read("example.h5", "foo/A")

#hdf5 cna be used to optimize reading and writing from disk in R


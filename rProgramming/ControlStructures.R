setwd("C:\\github\\datasciencecoursera\\rProgramming")

## If / Else

if (x>3)
{ y<-10
} else {y <-0}

y <- if (x>3) {
  10
} else {
  0
}

## Loops
# For Loop
# 4 ways to write them:
for (i in 1:10){
  print(i)
}

x <-c("a","b","c","d")
for (i in 1:4){
  print (x[i])
  }

for (i in seq_along(x)){
  print (x[i])
}
for (letter in x) {
  print(letter)}
#This last one is the same as the first one (optional curlies)
 for (i in 1:4) print (x[i])

#Nested for loop
x<-matrix(1:6, 2,3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print (x[i,j])
  }
}


## WHILE loop
count <-0
while (count < 10){
  print(count)
  count <- count+1
}
#While loops may be infinite!

z <-5

while (z >=3 && z <10) {
  print(z)
  coin <-rbinom(1,1,0.5)
  if(coin==1) {
    z <- z+1
  } else {
    z <- z -1
  }
}

# Repeat - Initiates an infinite loop and will not stop until a break is called
## no guarentee that it will stop:  requires convergence
## may want to use a for loop that handles non-convergence

x0 <-1
tol < 1e-8

repeat {
  x1 <-ComputeEstimate()
  
  if abs(x1-x0) <tol){
    break
  }
else {
  x1-x0
}
    }


#next, return
i <-1
for (i in 1:100) {
  if (i <=20){
      ## Skip the first 20 iterations
      next
  }
    print(i)
}
#return signals a function that should exit and return a given value


## R Functions



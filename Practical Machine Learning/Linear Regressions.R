#Linear Regressions
#Old Faithful

library(caret)

data("faithful")

#enable reproducability
set.seed(333)

#create training and test sets
intrain<-createDataPartition(y=faithful$waiting, p=.5, list=FALSE)
trainFaith <-faithful[intrain, ] 
testfaith<-faithful[-intrain,]

head(trainFaith)

#plot to see that it looks linear!
plot(trainFaith$waiting, trainFaith$eruptions)

#Eruption duration = incercept term + constant(WaitingTime)+ error margin
lm1<-lm(eruptions ~waiting, data=trainFaith)

#~ means a function of everything to the right side of the ~
summary(lm1)

#Estimates - Intercept

plot(trainFaith$waiting, trainFaith$eruptions)
lines(trainFaith$waiting, lm1$fitted, lwd=3)

#Predict a new variable 
#ED = b0 + b1WT
#80 is the new waiting 
#coef calls those values we saw in summary
coef(lm1)[1]+coef(lm1)[2]*80

#or use the predict function
newdata <-data.frame(waiting=80)
predict(lm1, newdata)

#now plot the test data and draw the prediction line
plot(testfaith$waiting, testfaith$eruptions)
lines(testfaith$waiting, predict(lm1, newdata=testfaith), lwd=3)

#get training and test set errors
#Use root mean square error
#How close are the predicted values to the real values
#On train - should be close
sqrt(sum((lm1$fitted-trainFaith$eruptions)^2))

#Now RMSE on test
#get the differnence between predictions and actual data
sqrt(sum((predict(lm1,newdata=testfaith)-testfaith$eruptions)^2))

#The error on the test data is ALMOST always larger than the rate of the training data

#prediction intervals
pred1 <- predict(lm1, newdata=testfaith, interval="prediction")
ord <- order(testfaith$waiting)

plot(testfaith$waiting, testfaith$eruptions)
matlines(testfaith$waiting[ord], pred1[ord,], type='l')

#Now do this in the caret package
modFit <-train(eruptions ~ waiting, data=trainFaith, method="lm")
summary(modFit$finalModel)
#The summary shows 

#Often useful in combination with other models
# high error rate when not necessarily linear



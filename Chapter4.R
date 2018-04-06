#### data spliting

library(AppliedPredictiveModeling)
data(twoClassData)
str(predictors)
str(classes)
library(caret)
set.seed(1)
trainingRows <- createDataPartition(classes, p = .80, list = FALSE)
head(trainingRows)
trainPredictors <- predictors[trainingRows,]
trainClasses <- classes[trainingRows]

testPredictors <- predictors[-trainingRows,]
testClasses <- class[-trainingRows]

str(trainPredictors)

#### Resampling

set.seed(1)
repeatedSplits <- createDataPartition(trainClasses, p=.80,times = 3)
str(repeatedSplits)

## 10-fold cross validation

set.seed(1)

cvSplits <- createFolds(trainClasses,k=10,returnTrain = TRUE)
str(cvSplits)

fold1 <- cvSplits[[1]]
cvPredictor1 <- trainPredictors[fold1,]
str(cvPredictor1)
cvClasses1 <- trainClasses[fold1]
nrow(trainPredictors)
nrow(cvPredictor1)

trainPredictors <- as.matrix(trainPredictors)

knnfit <- knn3(x=trainPredictors, y =trainClasses, k = 5)
knnfit

testPredictions <- predict(knnfit, newdata = testPredictors, type = "class")

head(testPredictions)
str(testPredictions)

# Model Evaluation
################################################
#install.packages("e1071")
#library(e1071)

## Logistic regression model
glm.pred <- predict(glm.tune, test.batch)
confusionMatrix(glm.pred, test.batch$repeater)

## Decison Tree
ctree.pred <- predict(ctree.tune, test.batch)
confusionMatrix(ctree.pred, test.batch$repeater)

## Boosted model
ada.pred <- predict(ada.tune, test.batch)
confusionMatrix(ada.pred, test.batch$repeater)

## Random Forest model
rf.pred <- predict(rf.tune, test.batch)
confusionMatrix(rf.pred, test.batch$repeater)

## SVM model 
svm.pred <- predict(svm.tune, test.batch)
confusionMatrix(svm.pred, test.batch$repeater)

## KNN model 
knn.pred <- predict(knn.tune, test.batch)
confusionMatrix(knn.pred, test.batch$repeater)

## AVG NNET model 
avnnet.pred <- predict(avnnet.tune, test.batch)
confusionMatrix(avnnet.pred, test.batch$repeater)

## GBM model 
gbm.pred <- predict(gbm.tune, test.batch)
confusionMatrix(gbm.pred, test.batch$repeater)

## glmnet model 
glmnet.pred <- predict(glmnet.tune, test.batch)
confusionMatrix(glmnet.pred, test.batch$repeater)

# ROC curves
################################################
## Logistic regression model (BLACK curve)
glm.probs <- predict(glm.tune, test.batch, type = "prob")
glm.ROC <- roc(response = test.batch$repeater,
               predictor = glm.probs$t,
               levels = levels(test.batch$repeater))
plot(glm.ROC, type="S")
glm.ROC
## CTree model (Grey curve)
ctree.probs <- predict(ctree.tune, test.batch, type = "prob")
ctree.ROC <- roc(response = test.batch$repeater,
               predictor = ctree.probs$t,
               levels = levels(test.batch$repeater))
plot(ctree.ROC, add=TRUE, col="grey")    
ctree.ROC
## Boosted model (GREEN curve)
ada.probs <- predict(ada.tune, test.batch, type = "prob")
ada.ROC <- roc(response = test.batch$repeater,
               predictor = ada.probs$t,
               levels = levels(test.batch$repeater))
plot(ada.ROC, add=TRUE, col="green")    
ada.ROC
## Random Forest model (RED curve)
rf.probs <- predict(rf.tune, test.batch, type = "prob")
rf.ROC <- roc(response = test.batch$repeater,
              predictor = rf.probs$t,
              levels = levels(test.batch$repeater))
plot(rf.ROC, add=TRUE, col="red") 
rf.ROC
## SVM model (BLUE curve)
svm.probs <- predict(svm.tune, test.batch, type = "prob")
svm.ROC <- roc(response = test.batch$repeater,
               predictor = svm.probs$t,
               levels = levels(test.batch$repeater))
plot(svm.ROC, add=TRUE, col="blue")
svm.ROC
## KNN model (YELLOW curve)
knn.probs <- predict(knn.tune, test.batch, type = "prob")
knn.ROC <- roc(response = test.batch$repeater,
               predictor = knn.probs$t,
               levels = levels(test.batch$repeater))
plot(knn.ROC, add=TRUE, col="yellow")
knn.ROC
## AVNNET model (ORANGE curve)
avnnet.probs <- predict(avnnet.tune, test.batch, type = "prob")
avnnet.ROC <- roc(response = test.batch$repeater,
               predictor = avnnet.probs$t,
               levels = levels(test.batch$repeater))
plot(avnnet.ROC, add=TRUE, col="orange")
avnnet.ROC
## GBM model (PINK curve)
gbm.probs <- predict(gbm.tune, test.batch, type = "prob")
gbm.ROC <- roc(response = test.batch$repeater,
                  predictor = gbm.probs$t,
                  levels = levels(test.batch$repeater))
plot(gbm.ROC, add=TRUE, col="pink")
gbm.ROC
## glmnet model (BROWN curve)
glmnet.probs <- predict(glmnet.tune, test.batch, type = "prob")
glmnet.ROC <- roc(response = test.batch$repeater,
               predictor = glmnet.probs$t,
               levels = levels(test.batch$repeater))
plot(glmnet.ROC, add=TRUE, col="brown")
glmnet.ROC
# graph which sums up the performance of the four models
########################################################

cv.values <- resamples(list(Logit = #glm.tune, 
                                    #ctree = ctree.tune,
                                    ada.tune, 
                                    RF = rf.tune, 
                                    SVM = svm.tune,
                                    KNN = knn.tune,
                                    AVNNET = avnnet.tune,
                                    GBM = gbm.tune,
                                    GLMNET = glmnet.tune))
dotplot(cv.values, metric = "ROC")


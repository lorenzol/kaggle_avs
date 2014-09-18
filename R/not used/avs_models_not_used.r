##########################################################
# glm model

set.seed(35)
glm.tune <- train(repeater ~ .,
                  data = train.batch,
                  method = "glm",
                  metric = "ROC",       # "ROC" or "Accuracy"
                  tuneLength = 3, # try 9
                  trControl = cv.ctrl)

glm.tune
summary(glm.tune)
#model evaluation ROC or accuracy
glm.pred <- predict(glm.tune, test.batch)
confusionMatrix(glm.pred, test.batch$repeater)

#Decision Tree
######################################################
ctree.tune <- train(repeater ~ .,
                    data = train.batch, 
                    method='ctree', 
                    tuneLength=5, #5
                    metric = "ROC",
                    trControl=cv.ctrl)

ctree.tune
plot(ctree.tune)
#model evaluation ROC or accuracy
ctree.pred <- predict(ctree.tune, test.batch)
confusionMatrix(ctree.pred, test.batch$repeater)

#Boosted Classification Trees
######################################################
## note the dot preceding each variable
# .iter (number of boosting iterations, default=50)
# .maxdepth (depth of trees)
# .nu (shrinkage parameter, default=1)
ada.grid <- expand.grid(.iter = c(5, 10), #try(50,100)
                        .maxdepth = c(2, 4), #try(4,8)
                        .nu = c(0.1, 1)) # try(0.1,1)

set.seed(35)

#install.packages("ada")
library(ada)
ada.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "ada",
                  metric = "ROC",
                  tuneGrid = ada.grid, # can be commented out
                  trControl = cv.ctrl)

ada.tune
plot(ada.tune)
#model evaluation ROC or accuracy
ada.pred <- predict(ada.tune, test.batch)
confusionMatrix(ada.pred, test.batch$repeater)


# SVM
#################################################

#install.packages("kernlab")
library(kernlab)
set.seed(35)
svm.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "svmRadial",
                  tuneLength = 2, # try 9
                  preProcess = c("center", "scale"),
                  metric = "ROC",
                  trControl = cv.ctrl)

svm.tune
#model evaluation ROC or accuracy
svm.pred <- predict(svm.tune, test.batch)
confusionMatrix(svm.pred, test.batch$repeater)

# Avg NNET
#################################################
set.seed(825)
avnnet.tune <- train(repeater ~ ., 
                     data = train.batch,
                     method = "avNNet",
                     trace = FALSE,
                     tuneLength = 5, # try 10
                     metric = "ROC",
                     trControl = cv.ctrl)

avnnet.tune
#model evaluation ROC or accuracy
avnnet.pred <- predict(avnnet.tune, test.batch)
confusionMatrix(avnnet.pred, test.batch$repeater)

# KNN
#################################################
set.seed(35)
knn.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "knn",
                  # k=2, # not necessary
                  preProcess = c("center", "scale"),
                  tuneLength = 3, # try 10
                  metric = "ROC",
                  trControl = cv.ctrl)

knn.tune
#model evaluation ROC or accuracy
knn.pred <- predict(knn.tune, test.batch)
confusionMatrix(knn.pred, test.batch$repeater)
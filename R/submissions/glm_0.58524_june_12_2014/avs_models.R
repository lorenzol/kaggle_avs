# Lorenzo Luciano
# June 3, 2014
# AVS Competition on Kaggle

#set working directory
setwd("C:/Users/lorenzol/Google Drive/Kaggle/AVS/R") # at home

source("avs_data.R")

#for model evaluation
#install.packages("e1071")
library(e1071)

#Fitting a Model
#######################################################

## split training data into train batch and test batch

#caret: Classification and Regression Training
#install.packages("caret")
library(caret)

set.seed(23)
training.rows <- createDataPartition(train$repeater, 
                                     p = 0.8, list = FALSE)
col_names <- as.data.frame(names(train))
#1:id, 2:chain, 3:offer, 4:market, 5:offervalue, 6:offerdate 
train.batch <- train[training.rows, c(3:83) ]
test.batch <- train[-training.rows, c(3:83) ]

rm(training.rows)
rm(train)

gc()   #to "flush" memory before you run your script.



#Modeling
#########################################################
#install.packages("pROC")
library(pROC)
## Define control function to handle optional arguments for train function
## Models to be assessed based on largest absolute area under ROC curve
## For Accuracy, uncomment classProbs = TRUE, and summaryFunction = twoClassSummary

cv.ctrl <- trainControl(method = "repeatedcv",  # cross validation
                        #method = "boot",       # choose 1 method
                        number = 2,            # 10 fold 
                        repeats = 1,            # 3 seperate 
                        returnResamp = "all",
                        classProbs = TRUE,
                        summaryFunction = twoClassSummary
                        )

##########################################################
# glm model
set.seed(35)
glm.tune <- train(repeater ~ .,
                  data = train.batch,
                  method = "glm",
                  metric = "ROC",       # "ROC" or "Accuracy"
                  tuneLength = 1, # try 9
                  trControl = cv.ctrl)

glm.tune
summary(glm.tune)
#model evaluation ROC or accuracy
glm.pred <- predict(glm.tune, test.batch)
confusionMatrix(glm.pred, test.batch$repeater)
# Random Forest
#################################################
# Strobl et al suggested setting mtry at the square root of the number of variables. 
# In this case, that would be mtry = 2,

#rf.grid <- data.frame(.mtry = c(3))
#rf.grid = expand.grid(.mtry = seq(2,6,by=1))

set.seed(35)
rf.tune <- train(repeater ~ .,
                 data = train.batch,
                 method = "rf",
                 metric = "ROC",
                 #tuneGrid = rf.grid,
                 #ntrees=1000,   #optional
                 #importance = TRUE, #optional, not sure what it does
                 trControl = cv.ctrl)

rf.tune
#model evaluation ROC or accuracy
rf.pred <- predict(rf.tune, test.batch)
confusionMatrix(rf.pred, test.batch$repeater)

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

# GBM - Stochastic Gradient Boosting
#################################################
set.seed(825)
gbmGrid <-  expand.grid(interaction.depth = c(1, 5, 9),
                        n.trees = (1:30)*50,
                        shrinkage = 0.1)

nrow(gbmGrid)

gbm.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "gbm",
                  trControl = cv.ctrl,
                  verbose = FALSE,
                  #tuneGrid = gbmGrid,  #specify exact models to evaluate
                  metric = "ROC"
                  ) 
gbm.tune
#model evaluation ROC or accuracy
gbm.pred <- predict(gbm.tune, test.batch)
confusionMatrix(gbm.pred, test.batch$repeater)

trellis.par.set(caretTheme())
plot(gbm.tune)
ggplot(gbm.tune)


# glmnet
#################################################

#glmnetGrid <- expand.grid(.alpha = (1:10) * 0.01, 
#              .lambda = (1:10) * 0.01)

glmnetGrid <- expand.grid(.alpha = 0.0001, 
                          .lambda = 0.0001)

glmnet.tune <- train(repeater ~ .,
                     data = train.batch,
                     method = "glmnet",
                     family = "binomial",
                     tuneGrid = glmnetGrid,
                     metric = "ROC",
                     trControl = cv.ctrl)
		
glmnet.tune
#model evaluation ROC or accuracy
glmnet.pred <- predict(glmnet.tune, test.batch)
confusionMatrix(glmnet.pred, test.batch$repeater)

trellis.par.set(caretTheme())
plot(glmnet.tune)
ggplot(glmnet.tune)


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
                                     p = 0.10, list = FALSE)


col_names <- as.data.frame(names(train))
#1:id, 2:chain, 3:offer, 4:market, 5:offervalue, 6:offerdate 

train.batch <- train[training.rows, c(2,3:382) ]
test.batch <- train[-training.rows, c(2,3:382) ]



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
                        #method = "cv",        # choose 1 method
                        #method = "boot",       # 
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
                  maximize = TRUE,
                  tuneLength = 2, # try 9
                  trControl = cv.ctrl)

glm.tune
summary(glm.tune)
#model evaluation ROC or accuracy
glm.pred <- predict(glm.tune, test.batch)
confusionMatrix(glm.pred, test.batch$repeater)

confusionMatrix(predict(glm.tune, test.batch), test.batch$repeater)

# GBM - Stochastic Gradient Boosting
#################################################
set.seed(825)
gbmGrid <-  expand.grid(interaction.depth = c(5, 9),
                        n.trees = c(100, 150, 200),
                        shrinkage = 0.1)

nrow(gbmGrid)

gbm.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "gbm",
                  trControl = cv.ctrl,
                  verbose = FALSE,
                  tuneGrid = gbmGrid,  #specify exact models to evaluate
                  metric = "ROC",
                  maximize = TRUE
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

#glmnetGrid <- expand.grid(.alpha = (0:10) * 0.001, 
#              .lambda = (0:10) * 0.001)

glmnetGrid <- expand.grid(.alpha = (0.01:0.02) * 0.001, 
                          .lambda = 0)

glmnet.tune <- train(repeater ~ .,
                     data = train.batch,
                     method = "glmnet",
                     family = "binomial",
                     tuneGrid = glmnetGrid,
                     metric = "ROC",
                     maximize = TRUE,
                     trControl = cv.ctrl)
		
glmnet.tune
#model evaluation ROC or accuracy
glmnet.pred <- predict(glmnet.tune, test.batch)
confusionMatrix(glmnet.pred, test.batch$repeater)

trellis.par.set(caretTheme())
plot(glmnet.tune)
ggplot(glmnet.tune)


# earth model
#######################################
## Example with a custom metric
#method = 'bagEarth'
#Type: Regression, Classification
#Tuning Parameters: nprune (#Terms), degree (Product Degree)
set.seed(825)
rf.grid <- data.frame(.mtry = c(0.00001, 0.0001))

earth.tune <- train(repeater ~ .,
                    data = train.batch, 
                    model = "bagEarth",
                    #tuneGrid = marsGrid,
                    metric = "ROC",
                    maximize = FALSE,
                    tuneGrid = rf.grid,
                    trControl = cv.ctrl)

earth.tune
earth.tune.pred <- predict(earth.tune, test.batch)
confusionMatrix(earth.tune.pred, test.batch$repeater)

# regularized discriminant analysis model
################################################
set.seed(825)

rda.tune <- train(repeater ~ ., 
                  data = train.batch,
                  method = "rda",
                  trControl = cv.ctrl,
                  tuneLength = 2,
                  maximize = FALSE,
                  metric = "ROC")

rda.tune
#model evaluation ROC or accuracy
rda.pred <- predict(rda.tune, test.batch)
confusionMatrix(rda.pred, test.batch$repeater)
###############################################


# various bagging models
#######################################
## methods: 'earth-ok','treebag-ok', 'bagFDA', 'logicBag', 'bagEarth', 'bag'
## 'cforest', 'avNNet', 'parRF', 'qrf', 'qrnn', 'rFerns', 'rf-ok', 
## 'extraTrees-x', 'RRF-x', 'RRFglobal-ok', 'dnn-x'
##
library(rpart)
library(mlbench)
library(qrnn)
library(deepnet)
library(RRF)
library(obliqueRF)
library(Boruta)

tuneGrid = data.frame(.mtry = c(2,5,10,15,20))

bag.tune <- train(repeater ~ .,
                    data = train.batch, 
                    method = 'Boruta',
                    metric = "ROC",
                    maximize = FALSE,
                    trControl = cv.ctrl)

bag.tune
bag.tune.pred <- predict(bag.tune, test.batch)
confusionMatrix(bag.tune.pred, test.batch$repeater)


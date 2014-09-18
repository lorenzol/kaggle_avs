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

train.batch <- train[training.rows, c(3:167) ]
test.batch <- train[-training.rows, c(3:167) ]



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

# earth model
#######################################
set.seed(825)
rf.grid <- data.frame(.mtry = c(2,3,4))

earth.tune <- train(repeater ~ .,
                    data = train.batch, 
                    model = "bagEarth",
                    metric = "ROC",
                    maximize = FALSE,
                    tuneGrid = rf.grid,
                    trControl = cv.ctrl)

earth.tune
earth.tune.pred <- predict(earth.tune, test.batch)
confusionMatrix(earth.tune.pred, test.batch$repeater)

# Quantile Random Forest
#######################################
set.seed(825)
qrf.grid <- data.frame(.mtry = c(0.00001, 0.0001))

qrf.tune <- train(repeater ~ .,
                  data = train.batch, 
                  method = "extraTrees",
                  metric = "ROC",
                  maximize = FALSE,
                  #tuneGrid = qrf.grid,
                  trControl = cv.ctrl)

qrf.tune
qrf.tune.pred <- predict(qrf.tune, test.batch)
confusionMatrix(qrf.tune.pred, test.batch$repeater)



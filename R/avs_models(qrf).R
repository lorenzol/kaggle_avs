# Lorenzo Luciano
# June 30, 2014
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

training.rows <- createDataPartition(train$repeattrips, 
                                     p = 0.10, list = FALSE)


col_names <- as.data.frame(names(train))
#1:id, 2:chain, 3:offer, 4:market, 5:offervalue, 6:offerdate 

train.batch <- train[training.rows, c(3:225) ]
test.batch <- train[-training.rows, c(3:225) ]

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

# Quantile Random Forest
#######################################
set.seed(825)
#qrf.grid <- data.frame(.mtry = c(0.00001, 0.0001))

x <- train.batch[,c(1:222)]
y <- train.batch[,223]

qrf.tune <- train(x, y,
                  method = "qrf"
                  #metric = "ROC",
                  #maximize = FALSE,
                  #tuneGrid = qrf.grid,
                  #trControl = cv.ctrl
                  )

qrf.tune
plot(qrf.tune)
qrf.tune.pred <- predict(qrf.tune, test.batch)
confusionMatrix(qrf.tune.pred, test.batch$repeater)



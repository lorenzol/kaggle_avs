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
                                     p = 0.80, list = FALSE)


col_names <- as.data.frame(names(train))
#1:id, 2:chain, 3:offer, 4:market, 5:offervalue, 6:offerdate 

train.batch <- train[training.rows, c(3:123) ]
test.batch <- train[-training.rows, c(3:123) ]



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

confusionMatrix(predict(glm.tune, test.batch), test.batch$repeater)

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
                  tuneGrid = gbmGrid,  #specify exact models to evaluate
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

glmnetGrid <- expand.grid(.alpha = 0.001, 
                          .lambda = 0.001)

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


# model
#################################################

bagFDA.tune <- train(repeater ~ .,
                     data = train.batch,
                     method = "bagFDA",
                     metric = "ROC",
                     trControl = cv.ctrl)

bagFDA.tune
#model evaluation ROC or accuracy
bagFDA.pred <- predict(bagFDA.tune, test.batch)
confusionMatrix(bagFDA.pred, test.batch$repeater)

##################################################


require(quantreg)
require(mboost)
require(earth)
n <- 100
p <- 5
X <- matrix(rnorm(n*p),n,p)
y <- .95*apply(X,1,sum)+rnorm(n)
#constrain slope coefficients to lie between zero and one
R <- cbind(0,rbind(diag(p),-diag(p)))
r <- c(rep(0,p),-rep(1,p))
rq.tune <- bagFDA(repeater ~ ., data=train.batch)
rq.tune
rq.pred <- predict(rq.tune, test.batch)
confusionMatrix(rq.pred, test.batch$repeater)


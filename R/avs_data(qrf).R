# Lorenzo Luciano
# June 30 2014
# AVS data on Kaggle


#set working directory
setwd("C:/Users/lorenzol/Google Drive/Kaggle/AVS/R") # at home


#import train and test dataset
train <- read.csv("./data/train.csv", comment.char="")
test <- read.csv("./data/test.csv", comment.char="")

train_r <- train[, c("id", "chain", "repeater", "repeattrips")] # temporary store repeater value

comb <- rbind(train[,c(1:3,6:226)], test)


# Change NULLS to 0 for analysis
######################################
comb[is.na(comb)] <- 0


#Seperate Comb into train and test
######################################
train <- comb[c(1:160057),]
test <- comb[c(160058:311541),]

#train$repeater <- train_r$repeater
train$repeattrips <- train_r$repeattrips

rm(comb) # remove comb variable
rm(train_r) # remove train_r

save(test, file="test.RData")  # save test to fiel while not needed

rm(test)




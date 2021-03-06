# Lorenzo Luciano
# June 3, 2014
# AVS data on Kaggle


#set working directory
setwd("C:/Users/lorenzol/Google Drive/Kaggle/AVS/R") # at home


#import train and test dataset
train <- read.csv("./data/train.csv", comment.char="")
test <- read.csv("./data/test.csv", comment.char="")

train_r <- train[, c("id", "chain", "repeater")] # temporary store repeater value

comb <- rbind(train[,c(1:3,5:83)], test)

# Amelia - to view and analyze missing data
######################################
#install.packages("Amelia")
#library(Amelia)
#AmeliaView()
## map missing data by provided feature
#missmap(comb)


# Change NULLS to 0 for analysis
######################################
comb[is.na(comb)] <- 0

#ID variable
######################################
#comb$id <- as.factor(comb$id)


#chain variable
######################################
comb$chain <- as.factor(comb$chain)

#offer variable
######################################
#comb$offer <- as.factor(comb$offer)

#market variable
######################################
#comb$market <- as.factor(comb$market)

#total variables, change to numeric
######################################
#comb$tot_dis_items_p <- as.numeric(comb$tot_dis_items_p)
#comb$tot_n_depts <- as.numeric(comb$tot_n_depts)
#comb$tot_n_categories <- as.numeric(comb$tot_n_categories)
#comb$tot_n_companies <- as.numeric(comb$tot_n_companies)
#comb$tot_n_brands <- as.numeric(comb$tot_n_brands)
#comb$tot_n_trips <- as.numeric(comb$tot_n_trips)
#comb$tot_items_p <- as.numeric(comb$tot_items_p)

comb$tot_a_spent <- as.numeric(comb$tot_a_spent)
#comb$tot_a_spent_30 <- as.numeric(comb$tot_a_spent_30)

# change indicators to factors
#####################################
comb$ccb_ind <- as.factor(comb$ccb_ind)
comb$ccb_ind_30 <- as.factor(comb$ccb_ind_30)
comb$ccb_ind_60 <- as.factor(comb$ccb_ind_60)
comb$ccb_ind_180 <- as.factor(comb$ccb_ind_180)

comb$cat_ind <- as.factor(comb$cat_ind)
comb$cat_ind_30 <- as.factor(comb$cat_ind_30)
comb$cat_ind_60 <- as.factor(comb$cat_ind_60)
comb$cat_ind_180 <- as.factor(comb$cat_ind_180)

comb$com_ind <- as.factor(comb$com_ind)
comb$com_ind_30 <- as.factor(comb$com_ind_30)
comb$com_ind_60 <- as.factor(comb$com_ind_60)
comb$com_ind_180 <- as.factor(comb$com_ind_180)

comb$bra_ind <- as.factor(comb$bra_ind)
comb$bra_ind_30 <- as.factor(comb$bra_ind_30)
comb$bra_ind_60 <- as.factor(comb$bra_ind_60)
comb$bra_ind_180 <- as.factor(comb$bra_ind_180)

comb$tot_ind_30 <- as.factor(comb$tot_ind_30)
comb$tot_ind_60 <- as.factor(comb$tot_ind_60)
comb$tot_ind_180 <- as.factor(comb$tot_ind_180)


#Seperate Comb into train and test
######################################
train <- comb[c(1:160057),]
test <- comb[c(160058:311541),]

train$repeater <- train_r$repeater

rm(comb) # remove comb variable
rm(train_r) # remove train_r

save(test, file="test.RData")  # save test to fiel while not needed
rm(test)

#Only for testing ->train and test on a smaller subset
######################################
#train <- train[c(1:10000),]  








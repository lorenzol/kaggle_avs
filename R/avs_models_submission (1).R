
load(file="test.RData")

# Create Submission File on Test Data (must have test data ready)
########################################################
# name of test file = test
# use the model to generate predictions
repeater_glm <- predict(glm.tune, newdata = test, type="prob")

repeater_gbm <- predict(gbm.tune, newdata = test, type="prob")
repeater_glmnet <- predict(glmnet.tune, newdata = test, type="prob")

repeater_earth <- predict(earth.tune, newdata = test, type="prob")
repeater_qrd <- predict(qrf.tune, newdata = test, type="prob")

# Create dataset for export
#########################################################
repeater_glm <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_glm$t))

repeater_gbm <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_gbm$t))
repeater_glmnet <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_glmnet$t))

repeater_earth <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_earth$t))
repeater_qrf <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_qrf$t))


# write predictions to csv file for submission to Kaggle
#########################################################
write.csv(repeater_glm, file="glm_tune_model1.csv", row.names=FALSE, quote=FALSE)

write.csv(repeater_gbm, file="gbm_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_glmnet, file="glmnet_tune_model1.csv", row.names=FALSE, quote=FALSE)

write.csv(repeater_earth, file="earth_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_qrf, file="qrf_tune_model1.csv", row.names=FALSE, quote=FALSE)


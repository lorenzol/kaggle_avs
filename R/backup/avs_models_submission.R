
load(file="test.RData")

# Create Submission File on Test Data (must have test data ready)
########################################################
# name of test file = test
# use the model to generate predictions
repeater_glm <- predict(glm.tune, newdata = test, type="prob")
repeater_ctree <- predict(ctree.tune, newdata = test, type="prob")
repeater_ada <- predict(ada.tune, newdata = test, type="prob")
repeater_rf <- predict(rf.tune, newdata = test, type="prob")
repeater_svm <- predict(svm.tune, newdata = test, type="prob")
repeater_knn <- predict(knn.tune, newdata = test, type="prob")
repeater_avnnet <- predict(avnnet.tune, newdata = test, type="prob")
repeater_gbm <- predict(gbm.tune, newdata = test, type="prob")
repeater_glmnet <- predict(glmnet.tune, newdata = test, type="prob")

# Create dataset for export
#########################################################
repeater_glm <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_glm$t))
repeater_ctree <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_ctree$t))
repeater_ada <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_ada$t))
repeater_rf <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_rf$t))
repeater_svm <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_svm$t))
repeater_knn <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_knn$t))
repeater_avnnet <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_avnnet$t))
repeater_gbm <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_gbm$t))
repeater_glmnet <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_glmnet$t))


# write predictions to csv file for submission to Kaggle
#########################################################
write.csv(repeater_glm, file="glm_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_ctree, file="ctree_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_ada, file="ada_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_rf, file="rf_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_svm, file="svm_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_knn, file="knn_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_avnnet, file="avnnet_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_gbm, file="gbm_tune_model1.csv", row.names=FALSE, quote=FALSE)
write.csv(repeater_glmnet, file="glmnet_tune_model1.csv", row.names=FALSE, quote=FALSE)


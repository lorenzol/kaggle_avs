
load(file="test.RData")

repeater_qrf <- predict(qrf.tune, newdata = test, type="prob")

repeater_qrf <- data.frame(cbind("id" = test$id, "repeatProbability" = repeater_qrf$t))

write.csv(repeater_qrf, file="qrf_tune_model1.csv", row.names=FALSE, quote=FALSE)


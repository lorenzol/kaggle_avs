
table(train.batch$repeater)


logit1 <- glm(repeater ~ tot_dis_items_p + tot_n_depts + tot_n_categories
              + tot_n_companies + tot_n_brands + tot_n_trips
              , data=train.batch,
              family=binomial(link="logit"), na.action=na.pass)
logit1
summary(logit1)

predict1  <- predict(logit1, type="response")
predict1
summary(predict1)
table(train.batch$repeater, predict1)
pred_table <- data.frame(train.batch$repeater, predict1)

table(train.batch$repeater)

pred_table_t <- pred_table[pred_table$train.batch.repeater == 't',]



#model evaluation ROC or accuracy
logit1.pred <- predict(logit1, test.batch)
confusionMatrix(logit1.pred, test.batch$repeater)
logit1.pred

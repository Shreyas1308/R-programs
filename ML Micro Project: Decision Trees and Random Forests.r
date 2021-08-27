library(ggplot2)
library(ISLR)
library(dplyr)
library(caTools)
library(rpart)

df <- College
head(College)

ggplot(df,aes(Room.Board,Grad.Rate)) + geom_point(aes(color=Private))

ggplot(df,aes(F.Undergrad)) + geom_histogram(aes(fill=Private),color="black",bins=50)

ggplot(df,aes(Grad.Rate)) + geom_histogram(aes(fill=Private),color="black",bins=50)

subset(df,Grad.Rate>100)

df['Cazenovia College','Grad.Rate'] <- 100

set.seed(101)

sample = sample.split(df$Private,SplitRatio=0.7)
train = subset(df,sample==T)
test = subset(df,sample==F)

tree <- rpart(Private ~ . ,method="class",data=train)
tree.preds <- predict(tree,test)
head(tree.preds)

tree.preds <- as.data.frame(tree.preds)
tree.preds$Private <- ifelse(tree.preds$Yes > 0.5,"Yes","No")

table(tree.preds$Private,test$Private)

library(rpart.plot)
prp(tree)

library(randomForest)
rf.model <- randomForest(Private ~ ., data=train,importance=TRUE)
p <- predict(rf.model,test)

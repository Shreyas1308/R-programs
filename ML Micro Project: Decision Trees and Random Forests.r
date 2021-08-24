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

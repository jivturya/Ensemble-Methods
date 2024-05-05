rm(list=ls())
set.seed(7)

#Read Crime data to R
crime_data=read.table("M:/OMSA/ISYE6501/HW5/crime.txt",header=TRUE)
head(crime_data)

library(randomForest)
library(tree)

#Build a model using tree
model_tree=tree(Crime~.,data=crime_data)
summary(model_tree)

#Visual representation of a Tree model
plot(model_tree)
text(model_tree)

#Check on how tree was split
model_tree$frame

#To ensure we choose the best amount of leave we will do a cross validation
cv.model_tree=cv.tree(model_tree)
plot(cv.model_tree$size,cv.model_tree$dev,type="b")

#model with 5 terminal nodes
prune_tree=prune.tree(model_tree,best=5)


#Visual representation of new pruned tree
plot(prune_tree)
text(prune_tree)


#Creating Baseline random forest model
random_forest=randomForest(Crime~.,data=crime_data,importance=TRUE,ntree=1000)
random_forest
importance(random_forest)

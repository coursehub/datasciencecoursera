## Assume that the file had already been loaded locally for computation. 
##Make sure that these librarys are added before starting
##Install the Hmisc,dplyr,reshape packages 
library(Hmisc)
library(dplyr)
library(reshape)

##Merge the test and training data
testfull1<- merge(total_acc_x_test,total_acc_x_train)
##Merge the test and training data
testfull2<- merge(total_acc_y_test,total_acc_y_train)
head(testfull2)


##Merge the test and training data
testfull1_a<- merge.data.frame(total_acc_x_test,total_acc_x_train,by="V1")
##Merge the test and training data
testfull2_b<- merge.data.frame(total_acc_y_test,total_acc_y_train,by="V1")
summary(testfull1_a)
##Merge the test and training data
testfull3_c<- merge.data.frame(total_acc_z_test,total_acc_z_train,by="V1")
summary(testfull3_c)

## Rename programmatically
## Rename variable to merge
testfull1_a <- rename(testfull1_a, c(V1="V1",V2="V2"))
testfull2_b <- rename(testfull2_b, c(V1="V1",V2="V2"))
testfull3_c <- rename(testfull3_c, c(V1="V1",V2="V2"))


tidydata<-testfull1_a
tidydata<-rename(tidydata,c(mean="Accxmean",V2="Accxstdev",V3="Accymean",V4="Accystdev",V5="Acczmean",V6="Acczstdev",V7="Subject",V8="Activity",V9="Variable"))
colnames(tidydata)<- c("accxmean","accxstdev","accymean","accystdev","acczmean","acczstdev")
summary(tidydata)


tidydata<-group_by(tidydata,accxmean)
small_data<-tidydata[1:6]
summary(small_data)

##Keep data needed for the extract
small_data2<-small_data[1:3]

colnames(small_data2)<- c("Subject","Variable","Activity")

## Group the Subject and Activity
small_data3<-group_by(small_data2,Subject)
small_data4<-group_by(small_data2,Activity)

##Summary given for the subject Variable and Activity
summary(small_data4)

##Import data files
features<-read.table("UCI HAR Dataset/features.txt",sep="")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt",sep="",col.names=features[,2])
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",sep="",col.names="Activity")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt",sep="",col.names=features[,2])
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",sep="",col.names="Activity")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",sep="",col.names=c("Activity","Activity_Name"))
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",sep="",col.names="Subject")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",sep="",col.names="Subject")

##load libraries needed for remainder
library(plyr)
library(reshape2)

##Join activity name to activity type
testactivity<-join(y_test,activity_labels)
trainactivity<-join(y_train,activity_labels)

##Bind activity type/activity name as well as subject number to actual data files
TEST<-cbind(subject_test,testactivity,X_test)
TRAIN<-cbind(subject_train,trainactivity,X_train)

##create new data set combining TEST and TRAIN data
newdata<-rbind(TEST,TRAIN)

##create data set including only columns with means and standard deviations
newdata_means<-cbind(newdata[,c(1,3)],newdata[,grep("*MEAN*",toupper(colnames(newdata)))],
         newdata[,grep("*STD*",toupper(colnames(newdata)))])

##melt data
newmelt<-melt(newdata_means,id=c("Subject","Activity_Name"))

##create new tidy data with averages of each mean/std variable for each Activity and subject
avg_activity<-dcast(newmelt,Activity_Name+variable~Subject,mean)

##rename column names so that they are descriptive for the Subject
cnames<-c(colnames(avg_activity[1:2]))
for (i in 3:32){
  cnames<-c(cnames,paste("Subject",colnames(avg_activity[i]),sep=""))
}
colnames(avg_activity)<-cnames

##write external .txt file
write.table(avg_activity,file="avgforactivity_subject.txt",sep="\t",row.names=FALSE)

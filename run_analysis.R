xtest<-read.table("ucidataset\\test\\X_test.txt")
xtrain<-read.table("ucidataset\\train\\X_train.txt")
ytest<-read.table("ucidataset\\test\\y_test.txt")
ytrain<-read.table("ucidataset\\train\\y_train.txt")
subtest<-read.table("ucidataset\\test\\subject_test.txt")
subtrain<-read.table("ucidataset\\train\\subject_train.txt")
variables<-read.table("ucidataset\\features.txt")
#loading all the data sets into R

combined_data<-rbind(xtest,xtrain)
#combining the actual data (the 561 element of variables) for the train and test sets
combined_sub<-rbind(subtest,subtrain)
#combining the subject id numbers for the train and test sets
combined_label<-rbind(ytest,ytrain)
#combining the activity id numbers for the train and test sets

fil1<-grep("-mean\\(\\)",variables$V2)
#finding the elements that contain variables in the actual data that calculate the mean
fil2<-grep("-std\\(\\)",variables$V2)
#finding the elements that contain variables in the actual data that calculate the stDev

fil<-c(fil1,fil2)
#combining the two previous vectors, to to get a full vector of elements of variables 
#that either calculate the mean of the stadard deviation

fil_data<-combined_data[,fil]
# using the above vector to only select the columns from the original data
#of the variables that either calculate the mean of the stadard deviation 

total_fil_data<-cbind(combined_sub,combined_label,fil_data)
#combining the filtered data, the subject ids and actvitiy ids


rename<-c(NULL)

for (i in fil){
        rename<-c(rename,as.character(variables$V2[i]))
}

names(total_fil_data)<-c("Subject","Activities",rename)

#changing the names of the variables in the data set from "V.1", "V.2" ect
# to the names of the variables they actually represent

total_fil_data<-arrange(total_fil_data,total_fil_data[[1]],total_fil_data[[2]])
#ordering the data by subject and with the subject by activity (in ascending order)

activity_label=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING","LAYING")

replace<-function(x){
activity_label=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING","LAYING")
activity_label[x]}

total_fil_data<-mutate(total_fil_data,Activities=unlist(lapply(total_fil_data$Activities,replace)))

#replacing the activity ids (1-6) with their actual activities (walking, sitting, standing ect.)

grouped_data<-group_by(total_fil_data,Subject,Activities)
#grouping the data by subject and activity

final_table<-summarize_at(grouped_data,.var=3:length(total_fil_data),mean)
# the tidy data, where the mean for each column (representing a variables) 
# has been calculated by subject and by activity

write.table(final_table,"uci_dataset_tidy_data.txt")
#writing the table into a txt file
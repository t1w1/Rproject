#Aftering processing the date we should run this scripts to combine all data


Count <-data.frame(id=rep(1:20))
Count_dist <- data.frame(id=rep(1:20))
Revenue <- data.frame(id=rep(1:20))
Click <- data.frame(id=rep(1:20))
Impression <- data.frame(id=rep(1:20))
Competition <- data.frame(id=rep(1:20))

files <- list.files()
print(files)
for(i in 1:length(files))
{
  Month <- substring(files[i],12,18)
  CurrentFile <- files[i]
  print(CurrentFile)
  
  CurrentData <- read.csv(CurrentFile)
  
  if(nrow(CurrentData)!=20) {print(paste0("nrows is not 20 in Month:",Month))}
  
  #Data_Count <- select(CurrentData,count_all)
  Data_Count <- as.data.frame(CurrentData[,'count_all'])
  names(Data_Count) <- Month
  Count <- cbind(Count,Data_Count)
  
  #Data_Count_dist <- select(CurrentData,count_dist_all)  
  Data_Count_dist <- as.data.frame(CurrentData[,'count_dist_all'])
  names(Data_Count_dist) <- Month
  Count_dist <- cbind(Count_dist,Data_Count_dist)
  
  #Data_Revenue <- select(CurrentData,revenue_all)  
  Data_Revenue <- as.data.frame(CurrentData[,'revenue_all'])
  names(Data_Revenue) <- Month
  Revenue <- cbind(Revenue,Data_Revenue)
  
  #Data_Click <- select(CurrentData,click_all)  
  Data_Click <- as.data.frame(CurrentData[,'click_all'])
  names(Data_Click) <- Month
  Click <- cbind(Click,Data_Click)
  
  #Data_impression <- select(CurrentData,impression_all)  
  Data_impression <- as.data.frame(CurrentData[,'impression_all'])
  names(Data_impression) <- Month
  Impression <- cbind(Impression,Data_impression)
  
  #Data_compression <- select(CurrentData,competition_all)  
  Data_compression <- as.data.frame(CurrentData[,'competition_all'])
  names(Data_compression) <- Month
  Competition <- cbind(Competition,Data_compression)
}

#need change file name
write.csv(Count,"All_kw_2yrs_Count_20170504.csv")
write.csv(Count_dist,"All_kw_2yrs_Count_Count_dist_201700504.csv")
write.csv(Revenue,"All_kw_2yrs_Revenue_20170504.csv")
write.csv(Click,"All_kw_2yrs_Click_20170504.csv")
write.csv(Impression,"All_kw_2yrs_Impression_20170504.csv")
write.csv(Competition,"All_kw_2yrs_Competition_20170504.csv")

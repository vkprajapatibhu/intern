library(plyr)

# get all the zip files
zipF <- list.files(path = "C:/Users/Affectionate/Downloads/Compressed/internship test", pattern = "*.zip", full.names = TRUE)

# unzip all your files
ldply(.data = zipF, .fun = unzip, exdir ="C:/Users/Affectionate/Desktop/unzipped" )

excel<-list.files(path = "C:/Users/Affectionate/Desktop/unzipped" , pattern="*.xlsx" ,full.names =TRUE)
file<-read.xlsx("C:/Users/Affectionate/Desktop/unzipped",excel,sheetIndex=1,startRow=1,
colNames=TRUE,rowNames=TRUE,detectDates=TRUE,skipEmptyRows=FALSE)

dataframe<-ldply(.data=excel , .fun=read.xlsx )
head(dataframe)
write.table(dataframe,file="C:/Users/Affectionate/Desktop/final.csv",sep=",",row.names=T,col.names=T)

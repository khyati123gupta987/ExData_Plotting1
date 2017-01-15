library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'";

myData <- read.csv2.sql("household_power_consumption.txt",mySql, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),header = TRUE,na.strings="?")

#Find DateTime variable
datetime<-paste(as.Date(myData$Date,"%d/%m/%Y"),myData$Time)
datetime<-strptime(datetime,  "%Y-%m-%d %H:%M:%S")
plot(datetime, myData$Global_active_power, xlab= "", ylab= "Global Active Power(kilowatts)", type='l', col='black') 


#save as png
dev.copy(png,"plot2.png", width=480, height=480)

dev.off()
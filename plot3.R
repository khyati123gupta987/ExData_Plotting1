library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'";

myData <- read.csv2.sql("household_power_consumption.txt",mySql, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),header = TRUE,na.strings="?")

#Find DateTime variable
datetime<-paste(as.Date(myData$Date,"%d/%m/%Y"),myData$Time)
datetime<-strptime(datetime,  "%Y-%m-%d %H:%M:%S")

#adding plot and annotations
plot(datetime, myData$Global_active_power, xlab= "", ylab= "Global Active Power(kilowatts)", type='l', col='black') 
plot(datetime, myData$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type='l', col='black') 
lines(datetime,myData$Sub_metering_2,col="red")
lines(datetime,myData$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c('black'
                                                                                            ,'red','blue') )



#save as png
dev.copy(png,"plot3.png", width=480, height=480)

dev.off()
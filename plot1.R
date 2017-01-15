library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'";

myData <- read.csv2.sql("household_power_consumption.txt",mySql, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),header = TRUE,na.strings="?")

hist(myData$Global_active_power,col='red',xlab = 'Global Active Power(kilowatts)',main="Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)

dev.off()
# R code for plot4
# If the data file does not exist in the working directory then download the file and unzip
# else read the data file
if(! file.exists("household_power_consumption.txt")){
  ####download the Zip file and Unzip the zip file
  ###household_power_consumption.txt is the file name
  zip.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  dir <- getwd()
  
  zipfile <- "household_power_consumption.zip"
  
  zip.combine <- as.character(paste(dir, zipfile, sep = "/"))
  
  download.file(zip.url, destfile = zip.combine)
  
  unzip(zipfile)
}

#Reading the data file
householdPowerfile <- "household_power_consumption.txt"
householdPowerData <- read.table(householdPowerfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".",na.strings = "?")

# filtering the required data

req.data <- householdPowerData[householdPowerData$Date %in% c("1/2/2007","2/2/2007"),]
# convert the date and time as  as "2007-02-01 00:00:00 CST"
DataTime <- strptime(paste(req.data$Date, req.data$Time), "%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(DataTime,req.data$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(DataTime,req.data$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(DataTime, req.data$Sub_metering_1,xlab= "",ylab="Energy sub Metering", type="n")
lines(DataTime,req.data$Sub_metering_1,type = "l",col="black")
lines(DataTime,req.data$Sub_metering_2,type = "l",col="red")
lines(DataTime,req.data$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd=2.5,col=c("black","red","blue"))
plot(DataTime,req.data$Global_active_power,xlab="datetime",ylab="Global_Active_Power",type="l")
dev.off()
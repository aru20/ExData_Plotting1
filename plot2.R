# R code for plot2
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
#plotting the graph
png(filename="plot2.png")
plot(DataTime,req.data$Global_active_power,type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
# close the device
dev.off()



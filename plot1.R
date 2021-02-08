getwd()

####download the Zip file and Unzip the zip file 
###household_power_consumption.txt is the file name
zip.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dir <- getwd()

zipfile <- "household_power_consumption.zip"

zip.combine <- as.character(paste(dir, zipfile, sep = "/"))

download.file(zip.url, destfile = zip.combine)

unzip(zipfile)

## Reading the file "household_power_consumption.txt"
## dec- the character used in the file for decimal points
householdPowerfile <- "household_power_consumption.txt"
householdPowerData <- read.table(householdPowerfile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".",na.strings = "?")
str(householdPowerData)
head(householdPowerData)
# convert the date as "YYYY-mm-dd"
householdPowerData$Date <- as.Date(householdPowerData$Date, format="%d/%m/%Y")
#str(householdPowerData)
#householdPowerData$date class changed to Date
#householdPowerData$Date
#Filter the data according the required date 
requiredPowerData <- filter(householdPowerData, Date >= "2007-02-01" & Date <= "2007-02-02" )
str(requiredPowerData)
# Plotting the histogram, file name "plot1.png"
activepower <- as.numeric(requiredPowerData$Global_active_power)
png(filename="plot1.png")
hist (activepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# close the device
dev.off()

setwd("D://courseradata")
if(!file.exists('data4')) dir.create('data4')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data4/household_power_consumption.zip')
unzip('./data4/household_power_consumption.zip', exdir = './data4')

# read data into R
files <- file('./data4/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', header=TRUE, na.stings = "?")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dim(data)
#plot1.png
png("plot1.png", width = 480, height = 480, units='px')
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()
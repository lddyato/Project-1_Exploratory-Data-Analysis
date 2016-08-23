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

#plot4.png
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "voltage", type = "l")
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
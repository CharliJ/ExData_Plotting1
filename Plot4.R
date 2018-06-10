
# #Download and unzip the file
# temp <- tempfile()
# fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileURL,temp)
# unzip(temp)
# unlink(temp)

# read in the data from 2/1/2007 and 2/2/2007
headers <- read.csv2("household_power_consumption.txt", header = FALSE, nrows = 1, as.is = TRUE)

data <- read.csv2("household_power_consumption.txt", header = FALSE, sep = ";", quote = "", 
                  dec = ".", skip = 66637, nrows = 2880, 
                  colClasses = c("character", "character","numeric","numeric","numeric","numeric", "numeric", "numeric", "numeric"))

names(data)<-headers

# Put the data/time as the day of the week
data$datetime1<-paste0(data$Date," ", data$Time)
data$datetime<-strptime(data$datetime1, format = "%d/%m/%Y %H:%M:%S", tz="")


# Plot the data

png("Plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#Graph 2 (Position 1,1)
with(data, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",pch = NA_integer_))
lines(data$datetime, data$Global_active_power, lwd = 1)

#Graph (Position 1,2)

with(data, plot(datetime, Voltage,pch = NA_integer_))
lines(data$datetime, data$Voltage, lwd = 1)

#Graph 3(Position 2,1)
with(data, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",pch = NA_integer_))
lines(data$datetime, data$Sub_metering_1, lwd = 1)
lines(data$datetime, data$Sub_metering_2, lwd = 1, col = "red")
lines(data$datetime, data$Sub_metering_3, lwd = 1, col = "blue")
legend("topright", lty = c(1,1,1), bty = "n",col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Graph (Position 2,2)

with(data, plot(datetime, Global_reactive_power,pch = NA_integer_))
lines(data$datetime, data$Global_reactive_power, lwd = 1)

dev.off()


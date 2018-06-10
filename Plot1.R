
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

# Plot the data

png("Plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()


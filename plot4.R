##Creating plot4

##Establish a directory to load zip file

setwd("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Project 1/")

##Read the data into a table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Filter for a subset of the data
sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Convert to a date variable to a date class
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")

#Convert datetime variable to date-time class
sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

#Prepare datetime data
sub_data$datetime <- as.POSIXct(sub_data$datetime)

## Rename variables
globalActivePower <- sub_data$Global_active_power
subMetering1 <- sub_data$Sub_metering_1
subMetering2 <- sub_data$Sub_metering_2
subMetering3 <- sub_data$Sub_metering_3
voltage <-sub_data$Voltage

##Plot the data
attach(sub_data)

png(file = "plot4.png", height = 480, width = 480)
par(mfrow= c(2,2))

plot(Global_active_power ~ datetime, type="l",
     ylab = "Global Active Power", xlab = "", cex = .2)

plot(sub_data$datetime, voltage, type = "l", xlab = "datetime", ylab = "voltage")

plot(sub_data$datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(sub_data$datetime, subMetering2, type= "l", col = "red")
lines(sub_data$datetime, subMetering3, type= "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(Global_reactive_power ~ datetime, type="l",
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
detach(sub_data)


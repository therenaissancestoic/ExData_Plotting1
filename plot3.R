##Creating plot3

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

##Create a png file
png("plot3.png", width = 480, height = 480,
    units = "px", type = "cairo")

##Plot the energy submetering data
attach(sub_data)
plot(sub_data$datetime, subMetering1, type = "l", ylab = "Energy Sub metering", xlab = "", col = "black")
lines(sub_data$datetime, subMetering2, type= "l", col = "red")
lines(sub_data$datetime, subMetering3, type= "l", col = "blue")

##Create a legend 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, col = c("black", "red", "blue"))

dev.off()
detach(sub_data)






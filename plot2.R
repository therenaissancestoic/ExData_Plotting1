##Creating plot2

##Establish a directory to load zip file

setwd("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Project 1/")

##Read the data into a table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Filter for a subset of the data
sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Convert date variabe to a date class
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")

##Convert datetime variable to a date-time class. Use strptime to convert time from factor to a date-time class.
sub_data$datetime <- strptime(paste(sub_data$Date, sub_data$Time), format = "%Y-%m-%d %H:%M:%S")

##sub_data$datetime <- paste(sub_data$Date, sub_data$Time)
##gives you the same result even time is a factor class

##Prepare datetime data
sub_data$datetime <- as.POSIXct(sub_data$datetime)

##Create plot2
attach(sub_data)

plot(Global_active_power ~ datetime, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(sub_data)

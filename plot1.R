##Creating plot1

##Establish a directory to load zip file
setwd("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Exploratory Data Analysis/Project 1/")

##Read the data into a table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Filter for a subset of the data
sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##Convert date variable to a date class
sub_data$Date <- as.Date(sub_data$Date, format = "%d/%m/%Y")

##Create a png file to display plot
png("plot1.png", width = 480, height = 480, units = "px", type = "cairo")

##Create a histogram
hist(sub_data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "red")

dev.off()
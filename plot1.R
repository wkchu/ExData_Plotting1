# Exploratory Data Analysis - plot1.R
#
# Project # 1, due 02/08/2015
#
# Dataset: Electric power consumption [20Mb]
#
# Description: Measurements of electric power consumption in one household with a 
# one-minute sampling rate over a period of almost 4 years. Different electrical 
# quantities and some sub-metering values are available.
#
# The following descriptions of the 9 variables in the dataset, ";" is the separator
#    
#   Date: Date in format dd/mm/yyyy
#   Time: time in format hh:mm:ss
#   Global_active_power: household global minute-averaged active power (in kilowatt)
#   Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#   Voltage: minute-averaged voltage (in volt)
#   Global_intensity: household global minute-averaged current intensity (in ampere)
#   Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
#       It corresponds to the kitchen.
#   Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
#       It corresponds to the laundry room.
#   Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
#       It corresponds to an electric water-heater and an air-conditioner.
#
# Draw a histgram plot of Global_active_power from the dates 2007-02-01 and 2007-02-02.
#
file = "./data/household_power_consumption.txt"

# Read data from the dates 2007-02-01 and 2007-02-02.
skipLines = (66637 - 2 + 1)
readLines = (69517 - 66638 + 1)
colclasses = c("character", "character", "numeric")
colnames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Read in data, set the Data and Time column class to "character"
power_cnsm <- read.table(file, header = TRUE, sep=";", na.strings="?", skip=skipLines,
                   nrows=readLines, col.names = colnames, colClasses=colclasses)

# Open a PNG device
png("plot1.png", width = 480, height = 480) 

# Set margin and set the font family to "serif" in png device.
par(mar = c(4, 4, 2, 2), family="serif")

# # Draw histgram on PNG device
with(power_cnsm, hist(Global_active_power, main = "Global Active Power", 
                      xlab = "Global Active Power (kilowatts)", col = "red", 
                      lty=1))
# Close the device
dev.off()


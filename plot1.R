#Exploratory Data Analysis Project 1

# “Individual household electric power consumption Data Set” 
# Description: Measurements of electric power consumption in one household 
# with a one-minute sampling rate over a period of almost 4 years. 
# Different electrical quantities and some sub-metering values are available.

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

#setwd("/users/nihan/code/coursera/Exploratory Analysis/project1")
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"data.zip")
unzip("data.zip")
list.files(getwd())
#read entire data
powerdata<-read.table("household_power_consumption.txt",sep =";", header=TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string="?")
subsetpower<-powerdata[powerdata$Date=='1/2/2007'|powerdata$Date=='2/2/2007',]
subsetpower$DateTime<-as.POSIXct(paste(subsetpower$Date,subsetpower$Time),format="%d/%m/%Y %H:%M:%S")
rm(powerdata)
# plot 1: histogram
png(file="plot1.png",width = 480, height = 480)
# default res is 480x480 already
hist(subsetpower$Global_active_power,col="Red", xlab="Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()

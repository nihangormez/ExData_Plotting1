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

## Plot 4
png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(subsetpower$DateTime, subsetpower$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(subsetpower$DateTime, subsetpower$Voltage, type="l",ylab="Voltage", xlab="datetime")
### color plot starts
plotYrange<-c(min(rangeMetering[,1]),max(rangeMetering[,2]))
plot(range(subsetpower$DateTime),plotYrange,type="n",xlab="",ylab="Energy sub metering")
lines(subsetpower$DateTime,subsetpower$Sub_metering_1, col="Black")
lines(subsetpower$DateTime,subsetpower$Sub_metering_2, col="Red")
lines(subsetpower$DateTime,subsetpower$Sub_metering_3, col="Blue")
legend("topright", lty=1, col=c("Black","Red","Blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
### color plot ends
plot(subsetpower$DateTime, subsetpower$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()


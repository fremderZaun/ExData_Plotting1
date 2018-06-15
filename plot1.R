#clean workspace and set working directory
rm(list=ls())
setwd("H:/Rprog/coursera/exploratory_data_analysis")


###plot1

##load data
hpc <- read.table("household_power_consumption.txt",skip=1,sep=";",na.strings="?")
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
##subset data
hpc_sub <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
##convert dates and times
hpc_sub$Date <- as.Date(hpc_sub$Date, format = "%d/%m/%Y")
hpc_sub$Datetime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%Y-%m-%d %H:%M:%S")
hpc_sub$Datetime <- as.POSIXct(hpc_sub$Datetime)
##create plot1
hist(as.numeric(as.character(hpc_sub$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##save plot1
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()

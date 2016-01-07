# Unzip if data not there
if (!file.exists("household_power_consumption.txt")) { 
    unzip("household_power_consumption.zip") 
}

#Import data
full_data <- read.table("household_power_consumption.txt",sep=";",dec=".",na.strings = "?", stringsAsFactors = F, header = T)
#Select data for experiment
data <- full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007", ]
# Create one variable with time date
data$DTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Testing the plot
plot(data$DTime,data$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
lines(data$DTime,data$Sub_metering_2,type="l",col="red")
lines(data$DTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, col=c("black","red","blue"))

# Plot3 - as png                       
png("Plot3.png", width=480, height=480)
plot(data$DTime,data$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
lines(data$DTime,data$Sub_metering_2,type="l",col="red")
lines(data$DTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, col=c("black","red","blue"))
dev.off()

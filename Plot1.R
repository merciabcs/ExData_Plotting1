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
hist(data$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
    
# Plot1 - as png                       
png("Plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

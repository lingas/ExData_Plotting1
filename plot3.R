# Load Data into file
all_data = read.table("household_power_consumption.txt",,na = "?",sep = ";",header = TRUE,colClasses = c("character", "character", rep("numeric",7)))

# Subset data to obtain data from 1/2/2007 and 2/2/2007 only
data = all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]

# Date conversion 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date_time <- paste( as.Date(data$Date), data$Time)
data$date_time <- as.POSIXct(date_time)

# Set plot parametes
png(filename = "plot3.png",bg = "transparent", width = 480, height = 480, units = "px")

# Plot multi line graph
plot(data$date_time,data$Sub_metering_1,xlab="" ,ylab="Energy sub metering", type="l")
lines(data$date_time,data$Sub_metering_2, col="red")
lines(data$date_time,data$Sub_metering_3, col="blue")

# Plot legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))

# Shutdown graphic device
graphics.off()
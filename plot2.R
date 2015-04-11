# Load Data into file
all_data = read.table("household_power_consumption.txt",,na = "?",sep = ";",header = TRUE,colClasses = c("character", "character", rep("numeric",7)))

# Subset data to obtain data from 1/2/2007 and 2/2/2007 only
data = all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]

# Date conversion 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(data$Date), data$Time)
data$date_time <- as.POSIXct(date_time)

# Set plot parametes
png(filename = "plot2.png",bg = "transparent", width = 480, height = 480, units = "px")

# Plot line graph
plot(data$date_time,data$Global_active_power,xlab="" ,ylab="Global Active Power (kilowatts)", type="l")

# Shutdown graphic device
graphics.off()
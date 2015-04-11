# Load Data into file
all_data = read.table("household_power_consumption.txt",,na = "?",sep = ";",header = TRUE,colClasses = c("character", "character", rep("numeric",7)))

# Subset data to obtain data from 1/2/2007 and 2/2/2007 only
data = all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]

# Set plot parametes
png(filename = "plot1.png",bg = "transparent", width = 480, height = 480, units = "px")

# Plot histogram
hist = hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",ylim = c(0, 1200))

# Shutdown graphic device
graphics.off()
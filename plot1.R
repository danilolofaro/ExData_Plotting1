## Read data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./power.zip")
power <- read.table(unz("power.zip", "household_power_consumption.txt"),header = F,sep = ";",dec = ".", nrows = 2880,skip = 66637, na.strings = "?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power$DateTime <- strptime(paste(power$Date,power$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Plot
png("plot1.png",width = 480,height = 480)

hist(power$Global_active_power,main = "Global active power", xlab = "Global active power", col="red")

dev.off()

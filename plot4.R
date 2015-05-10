fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./power.zip")
power <- read.table(unz("power.zip", "household_power_consumption.txt"),header = F,sep = ";",dec = ".", nrows = 2880,skip = 66637, na.strings = "?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power$DateTime <- strptime(paste(power$Date,power$Time,sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Plot
png("plot4.png",width = 480,height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(power, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(DateTime, Sub_metering_2, col = 'red')
  lines(DateTime, Sub_metering_3, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", xlab = "")
})

dev.off()
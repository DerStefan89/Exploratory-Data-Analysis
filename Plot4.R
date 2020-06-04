##Plot4

# read in data
datafile <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
# subset datafile
sub.datafile <-subset(datafile,datafile$Date=="1/2/2007"|datafile$Date=="2/2/2007")
# change date and time
dt <- strptime(paste(sub.datafile$Date, sub.datafile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create files with specific values
gap.data <-sub.datafile$Global_active_power
gap.data2 <- sub.datafile$Global_reactive_power
gap.data3 <- sub.datafile$Voltage

# create variables with metering values
sm1 <- as.numeric(sub.datafile$Sub_metering_1)
sm2 <- as.numeric(sub.datafile$Sub_metering_2)
sm3 <- as.numeric(sub.datafile$Sub_metering_3)
# create empty png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# plot 
plot(dt, gap.data, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, gap.data2, type="l", xlab="datetime", ylab="Global_reactive_power")
plot(dt, gap.data3, type="l", xlab="datetime", ylab="Voltage")
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()

##Plot3

# read in data
datafile <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
# subset the datafile
sub.datafile <-subset(datafile,datafile$Date=="1/2/2007"|datafile$Date=="2/2/2007")
# change date and time
dt <- strptime(paste(sub.datafile$Date, sub.datafile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# create cariable with values of global_active_power
gap.data <- as.numeric(sub.datafile$Global_active_power)
# create Sub_metering Data
sm1 <- as.numeric(sub.datafile$Sub_metering_1)
sm2 <- as.numeric(sub.datafile$Sub_metering_2)
sm3 <- as.numeric(sub.datafile$Sub_metering_3)
# create empty png file
png("plot3.png", width=480, height=480)
# create plot and lines
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

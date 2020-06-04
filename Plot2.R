## Plot2

install.packages("lubridate")
library(lubridate)
install.packages("sqldf")
library(sqldf)

#read file
datafile <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
# subset date in datafile
sub.datafile1 <-subset(datafile,datafile$Date=="1/2/2007"|datafile$Date=="2/2/2007")
#create variable with values of sub.datafile
gap.data <-as.numeric(sub.datafile1$Global_active_power)
# create empty mpg file
png("plot2.png", width=480, height=480)
# change Date and Time
dt <- strptime(paste(sub.datafile1$Date, sub.datafile1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# plot file with dt and gap.data
plot(dt, gap.data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

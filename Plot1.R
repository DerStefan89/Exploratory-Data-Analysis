
## Plot 1
install.packages("dplyr")
library(dplyr)

# read file
datafile <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
# create variable with values of global_active_power
sub.datafile <-  as.numeric(datafile$Global_active_power)
# create empty png file
png("plot1.png",width=480,height=480)
# create histogram
hist(sub.datafile ,main="Global Active Power", 
     xlab="Global Active Power (kilowatt)", ylab="Frequency",col="red")
dev.off()
#read file
setwd("~/Coursera/exdata-data-household_power_consumption")
data_total <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filter dates

dates_ok <- data_total[data_total$Date %in% c("1/2/2007","2/2/2007") ,]

install.packages("dplyr")
library("dplyr")

# convert Date and Time variables to Date/Time classes
data_ok <- mutate(dates_ok, Date.ok = as.Date(Date, "%d/%m/%Y"),DateTime.ok = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),  tz = "GMT"))


#Plot 3

png("plot3.png", width=480, height=480)
plot(data_ok$DateTime.ok, data_ok$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data_ok$DateTime.ok, data_ok$Sub_metering_2, type="l", col="red")
lines(data_ok$DateTime.ok, data_ok$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1),  lwd = c(1, 1, 1))
dev.off()



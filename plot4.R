#read file
setwd("~/Coursera/exdata-data-household_power_consumption")
data_total <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filter dates

dates_ok <- data_total[data_total$Date %in% c("1/2/2007","2/2/2007") ,]

install.packages("dplyr")
library("dplyr")

# convert Date and Time variables to Date/Time classes
data_ok <- mutate(dates_ok, Date.ok = as.Date(Date, "%d/%m/%Y"),DateTime.ok = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),  tz = "GMT"))


#Plot 4

png(file = "plot4.png", bg = "white",width = 480, height = 480)
par(mfrow = c(2, 2))
#graph 1
plot(data_ok$Global_active_power ~data_ok$DateTime.ok, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#graph 2
plot(data_ok$Voltage ~data_ok$DateTime.ok, type="l", xlab = "datetime", ylab = "Voltage")

#graph 3
plot(data_ok$DateTime.ok, data_ok$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data_ok$DateTime.ok, data_ok$Sub_metering_2, type="l", col="red")
lines(data_ok$DateTime.ok, data_ok$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1),  lwd = c(1, 1, 1))

#graph 4
plot(data_ok$Global_reactive_power ~data_ok$DateTime.ok, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
#read file
setwd("~/Coursera/exdata-data-household_power_consumption")
data_total <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filter dates

dates_ok <- data_total[data_total$Date %in% c("1/2/2007","2/2/2007") ,]

install.packages("dplyr")
library("dplyr")

# convert Date and Time variables to Date/Time classes
data_ok <- mutate(dates_ok, Date.ok = as.Date(Date, "%d/%m/%Y"),DateTime.ok = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"),  tz = "GMT"))


#Plot 2

png(file = "plot2.png", bg = "white",width = 480, height = 480)
plot(data_ok$Global_active_power ~data_ok$DateTime.ok, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
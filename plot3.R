##Loading in the dataset
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

##Filtering the dates
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Converting the dates and times
data$Datetime <- as.POSIXct(datetime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Setting the PNG graphics
png("plot3.png", width = 480, height = 480)

dev.off()

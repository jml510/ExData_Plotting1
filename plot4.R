##Loading in the dataset
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

##Filtering the dates
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Converting the dates and times
data$Datetime <- as.POSIXct(datetime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

##Setting the PNG graphics
png("plot4.png", width = 480, height = 480)

##Creating all the graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()

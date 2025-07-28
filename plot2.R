##Loading in the dataset
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

##Filtering the dates
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Converting the dates and times
data$Datetime <- as.POSIXct(datetime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

##Creating the plot
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##Setting the PNG graphics
png("plot2.png", width = 480, height = 480)

dev.off()

##Loading in the dataset
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

##Filtering the dates
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

##Setting the PNG graphics
png("plot1.png", width = 480, height = 480)

##Creating the histogram
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()
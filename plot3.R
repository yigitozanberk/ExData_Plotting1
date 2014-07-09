
data <- read.table("household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = "?")

data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]

data[,1] <- paste(data[,1], data[,2])
data[,1] <- as.POSIXct(data[,1])

plot(data$Date, data$Sub_metering_1, type = "s", ylab = "Energy Sub Metering", xlab = "")
lines(data$Date, data$Sub_metering_2 , type = "s", col = "red")
lines(data$Date, data$Sub_metering_3 , type = "s", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

## Read data
source("./read_data.R")
data <- read_data()

## Create the plot
png(filename = "plot4.png")
par(mfrow=c(2, 2))
plot(
    data$DateTime, 
    data$Global_active_power, 
    type = "l", 
    xlab = "", 
    ylab = "Global Active Power (kilowatts)"
)

plot(
    data$DateTime,
    data$Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage"
)

plot(
    data$DateTime,
    data$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend(
    "topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lwd = c(1, 1, 1),
    col = c("black", "blue", "red")
)

plot(
    data$DateTime,
    data$Global_reactive_power,
    type = "l",
    xlab = "datetime"
)
dev.off()
## Read data
source("./read_data.R")
data <- read_data()

## Create the plot
png(filename = "plot2.png")
plot(
    data$DateTime, 
    data$Global_active_power, 
    type = "l", 
    xlab = "", 
    ylab = "Global Active Power (kilowatts)"
)
dev.off()
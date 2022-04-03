## Reads the data for the assignment and creates a dataframe
## Separated for re-usability

library(dplyr)

if (!dir.exists("./data")) {
    download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
        destfile = "data.zip"
    )
    unzip("./data.zip", exdir = "./data/")
    file.remove("./data.zip")
}

read_data <- function() {
    path_to_data = "./data/household_power_consumption.txt"
    data <- read.table(
        path_to_data, 
        header = TRUE, 
        sep = ";", 
        na.strings = "?",
        colClasses = c(
            "character", 
            "character",
            "numeric", 
            "numeric", 
            "numeric",
            "numeric",
            "numeric",
            "numeric",
            "numeric"
        ),
        nrows = 2075259,
    )
    data <- as_tibble(data)
    data$DateTime <- strptime(
        paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"
    )
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    start_date <- as.Date("2007-02-01")
    end_date <- as.Date("2007-02-02")
    filter(data, Date >= start_date, Date <= end_date)
}
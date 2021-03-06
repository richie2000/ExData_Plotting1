###########
# plot3.R #
###########
library(dplyr)

## Read data ##
original_ds  <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
original_ds$Date <- as.Date(original_ds$Date, format="%d/%m/%Y")
data <- subset(original_ds, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(original_ds)

## Create DateTime column ##
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

## Plot ##
with(data, {
    plot(data$Datetime, data$Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
    lines(data$Datetime, data$Sub_metering_2, col = "red")
    lines(data$Datetime, data$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"), lty=1)
})

## Save PNG file ##
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

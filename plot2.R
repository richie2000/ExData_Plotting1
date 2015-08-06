###########
# plot2.R #
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
x <- data$Datetime
y <- data$Global_active_power
plot(x, y, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save PNG file ##
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

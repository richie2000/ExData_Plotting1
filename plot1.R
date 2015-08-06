###########
# plot1.R #
###########
library(dplyr)

## Read data ##
original_ds  <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
original_ds$Date <- as.Date(original_ds$Date, format="%d/%m/%Y")
data <- subset(original_ds, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(original_ds)

## Plot ##
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Save PNG file ##
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

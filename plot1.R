## This script needs to be run in the same folder as "exdata-data-household_power_consumption.zip"
## This script outputs a png file, plot1.png for Exploratory Data Analysis Course Project 1

## Unzip Data
unzip("exdata-data-household_power_consumption.zip")

## load file into variable electricPowerConsumption
electricPowerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## reduce data to 2007-02-01 and 2007-02-02
electricPowerConsumption <- subset(electricPowerConsumption, Date == "1/2/2007"| Date == "2/2/2007")

## set Date as class date
electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, format = "%d/%m/%Y")

## set time as class time
electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, format = "%H:%M:%S")

## Open Dev
dev.cur()

## Open png device
png(filename = "plot1.png", width = 480, height = 480)

## Draw Plot 1
hist(electricPowerConsumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close dev
dev.off()

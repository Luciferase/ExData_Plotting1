## This script needs to be run in the same folder as "exdata-data-household_power_consumption.zip"
## This script outputs a png file, plot4.png for Exploratory Data Analysis Course Project 1

## Unzip Data
unzip("exdata-data-household_power_consumption.zip")

## load files
electricPowerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## reduce data to 2007-02-01 and 2007-02-02
electricPowerConsumption <- subset(electricPowerConsumption, Date == "1/2/2007"| Date == "2/2/2007")

## create new variable DateTime in electricPowerConsumption data set
dates <- electricPowerConsumption$Date
times <- electricPowerConsumption$Time
x <- paste(dates, times)
electricPowerConsumption$DateTime <- x
electricPowerConsumption$DateTime <- strptime(electricPowerConsumption$DateTime, format = "%d/%m/%Y %H:%M:%S")

## set Date as class date
electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, format = "%d/%m/%Y")

## set time as class time
electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, format = "%H:%M:%S")

## Open Dev
dev.cur()

## Open png device
png(filename = "plot4.png", width = 480, height = 480)

## Set par for 4 plots
par(mfcol = c(2, 2))

## Draw plot 1
plot(electricPowerConsumption$DateTime, electricPowerConsumption$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")

## Draw plot 2
plot(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")

## Add Sub_metering_2 to plot 2
points(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_2, type = "l", col = "red")

## Add Sub_metering_3 to plot 2
points(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_3, type = "l", col = "blue")

## Add legend to plot 2
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, bty = "n")

## Draw plot 3
plot(electricPowerConsumption$DateTime, electricPowerConsumption$Voltage, ylab = "Voltage", type = "l", xlab = "datetime")

## Draw plot 4
plot(electricPowerConsumption$DateTime, electricPowerConsumption$Global_reactive_power, ylab = "Global_reactive_power", type = "l", xlab = "datetime")

## Close dev
dev.off()

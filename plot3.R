
## load files

electricPowerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## reduce data to 2007-02-01 and 2007-02-02

electricPowerConsumption <- subset(electricPowerConsumption, Date == "1/2/2007"| Date == "2/2/2007")

## create new variable DateTime

dates <- electricPowerConsumption$Date
times <- electricPowerConsumption$Time
x <- paste(dates, times)
electricPowerConsumption$DateTime <- x
electricPowerConsumption$DateTime <- strptime(electricPowerConsumption$DateTime, format = "%d/%m/%Y %H:%M:%S")

## set Date as class date

## electricPowerConsumption$Date <- as.Date(electricPowerConsumption$Date, format = "%d/%m/%Y")

## set time as class time

## electricPowerConsumption$Time <- strptime(electricPowerConsumption$Time, format = "%H:%M:%S")

## Open Dev

dev.cur()

## Open png device

png(filename = "plot3.png", width = 480, height = 480)

## Draw Plot 1

## plot(electricPowerConsumption$DateTime, electricPowerConsumption$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")

plot(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
points(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_2, type = "l", col = "red")
points(electricPowerConsumption$DateTime, electricPowerConsumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1)

## Close dev

dev.off()
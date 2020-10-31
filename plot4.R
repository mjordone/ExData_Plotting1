#Obtaining and clining databases
library(dplyr)
Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
Data$Date <- strptime(Data$Date, "%d/%m/%Y") 
newdata <- Data %>% filter(Data$Date >= "2007-02-01", Data$Date <= "2007-02-02")
newdata$day <- weekdays(newdata$Date)

newdata$Global_active_power <- as.character(newdata$Global_active_power)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

newdata$DateTime <- paste(newdata$Date, newdata$Time)
newdata$DateTime <- strptime(newdata$DateTime, "%Y-%m-%d %H:%M:%S")

newdata$Sub_metering_1 <- as.character(newdata$Sub_metering_1)
newdata$Sub_metering_1 <- as.numeric(newdata$Sub_metering_1)

newdata$Sub_metering_2 <- as.character(newdata$Sub_metering_2)
newdata$Sub_metering_2 <- as.numeric(newdata$Sub_metering_2)

newdata$Sub_metering_3 <- as.character(newdata$Sub_metering_3)
newdata$Sub_metering_3 <- as.numeric(newdata$Sub_metering_3)


# Plot 4
par(mfcol = c(2, 2), mar = c(4,4,2,1), pin = c(2.2, 1.5))

plot(newdata$DateTime, newdata$Global_active_power, type = "lines", xlab = "", ylab = "Global Active Power")

plot(newdata$DateTime, newdata$Sub_metering_1, type = "lines", xlab = "", ylab = "Energy sub metering")
with(newdata, lines(newdata$DateTime, newdata$Sub_metering_2, col = "red"))
with(newdata, lines(newdata$DateTime, newdata$Sub_metering_3, col = "blue"))
legend("topright", lty=c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(newdata$DateTime, as.numeric(newdata$Voltage), type = "lines", xlab = "datetime", ylab = "Voltage")

plot(newdata$DateTime, newdata$Global_reactive_power, type = "lines", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()

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


#Plot 3
plot(newdata$DateTime, newdata$Sub_metering_1, type = "lines", xlab = "", ylab = "Energy sub metering")
with(newdata, lines(newdata$DateTime, newdata$Sub_metering_2, col = "red"))
with(newdata, lines(newdata$DateTime, newdata$Sub_metering_3, col = "blue"))
legend("topright", lty=c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()

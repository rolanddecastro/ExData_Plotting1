householdpower <- read.table("./household_power_consumption.txt", 
                             sep = ";", header = TRUE, na.strings = "?")

twoday_householdpower <- householdpower[householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007",]

datetime <- paste(twoday_householdpower$Date, twoday_householdpower$Time)
datetime <- as.POSIXct(strptime(datetime , "%d/%m/%Y %H:%M:%S", tz = "UTC"))

twoday_householdpower <- cbind(twoday_householdpower, datetime)

png("plot4.png")

par(mfrow = c(2,2))

#graph 1
with(twoday_householdpower, 
     plot(datetime, Global_active_power, type = "l", 
          xlab = "", ylab = "Global Active Power"))

#graph 2
with(twoday_householdpower, 
     plot(datetime, Voltage, type = "l", 
          xlab = "datetime", ylab = "Voltage"))


#graph 3
with(twoday_householdpower, 
    plot(datetime, Sub_metering_1, type = "n", 
          xlab = "", ylab = "Energy sub metering"))
with(twoday_householdpower, lines(datetime, Sub_metering_1))
with(twoday_householdpower, lines(datetime, Sub_metering_2, col = "red"))
with(twoday_householdpower, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("sub_metering_1",
    "sub_metering_2", "sub_metering_3"), bty = "n")


#graph 4
with(twoday_householdpower, 
     plot(datetime, Global_reactive_power, type = "l", 
          xlab = "datetime"))

dev.off()

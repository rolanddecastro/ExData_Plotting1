householdpower <- read.table("./household_power_consumption.txt", 
                             sep = ";", header = TRUE, na.strings = "?")

twoday_householdpower <- householdpower[householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007",]

datetime <- paste(twoday_householdpower$Date, twoday_householdpower$Time)
datetime <- as.POSIXct(strptime(datetime , "%d/%m/%Y %H:%M:%S", tz = "UTC"))

twoday_householdpower <- cbind(twoday_householdpower, datetime)

png("plot3.png")

with(twoday_householdpower, 
    plot(datetime, Sub_metering_1, type = "n", 
        xlab = "", ylab = "Energy sub metering"))
with(twoday_householdpower, lines(datetime, Sub_metering_1))
with(twoday_householdpower, lines(datetime, Sub_metering_2, col = "red"))
with(twoday_householdpower, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("sub_metering_1",
            "sub_metering_2", "sub_metering_3"))

dev.off()
householdpower <- read.table("./household_power_consumption.txt", 
                             sep = ";", header = TRUE, na.strings = "?")

twoday_householdpower <- householdpower[householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007",]

datetime <- paste(twoday_householdpower$Date, twoday_householdpower$Time)
datetime <- as.POSIXct(strptime(datetime , "%d/%m/%Y %H:%M:%S", tz = "UTC"))

twoday_householdpower <- cbind(twoday_householdpower, datetime)

png("plot2.png")

with(twoday_householdpower, 
    plot(datetime, Global_active_power, type = "l", 
    xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()

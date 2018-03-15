householdpower <- read.table("./household_power_consumption.txt", 
    sep = ";", header = TRUE, na.strings = "?")

twoday_householdpower <- householdpower[householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007",]

png("plot1.png")

with(twoday_householdpower, hist(Global_active_power, 
    col = "red", xlab = "Global Active Power (kilowatts)", 
    main = "Global Active Power"))

dev.off()


Plot4 <- function()
{
    origData <- read.csv(file="household_power_consumption.txt", sep=";", nrows=70000)
    origData$Date <- as.Date(origData$Date, "%d/%m/%Y")
    
    subsetData <- origData[origData$Date =="2007-02-01" | origData$Date == "2007-02-02",]
    subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
    
    dateTime <- strptime( paste(subsetData$Date,subsetData$Time), format="%Y-%m-%d %H:%M:%S")
    
    subsetData$Sub_metering_1 <- as.numeric(as.character(subsetData$Sub_metering_1))
    subsetData$Sub_metering_2 <- as.numeric(as.character(subsetData$Sub_metering_2))
    subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)
    
    png("Plot4.png", width=480, height=480)

    par(mfcol = c(2,2))
    
    with(subsetData, plot(dateTime, Global_active_power/500, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
    
    plot(dateTime, subsetData$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="black")
    lines(dateTime, subsetData$Sub_metering_2, type="l", col="red")
    lines(dateTime, subsetData$Sub_metering_3, type="l", col="blue")
    legend("topright", bty="n", col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    subsetData$Voltage <- as.numeric(as.character(subsetData$Voltage))
    with(subsetData, plot(dateTime, subsetData$Voltage, type="l", xlab="datetime", ylab="Voltage"))
    
    subsetData$Global_reactive_power <- as.numeric(as.character(subsetData$Global_reactive_power))
    with(subsetData, plot(dateTime, subsetData$Global_reactive_power, type="l", xlab="datetime"))
    
    #dev.copy(png, file = "Plot4.png", width=480, height=480)
    dev.off()    
}

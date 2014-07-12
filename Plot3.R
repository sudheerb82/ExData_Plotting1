
Plot3 <- function()
{
    origData <- read.csv(file="household_power_consumption.txt", sep=";", nrows=70000)
    origData$Date <- as.Date(origData$Date, "%d/%m/%Y")
    
    subsetData <- origData[origData$Date =="2007-02-01" | origData$Date == "2007-02-02",]
    subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
    
    dateTime <- strptime( paste(subsetData$Date,subsetData$Time), format="%Y-%m-%d %H:%M:%S")
    
    subsetData$Sub_metering_1 <- as.numeric(as.character(subsetData$Sub_metering_1))
    subsetData$Sub_metering_2 <- as.numeric(as.character(subsetData$Sub_metering_2))
    subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

    png("Plot3.png", width=480, height=480)
    
    plot(dateTime, subsetData$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="black")
    lines(dateTime, subsetData$Sub_metering_2, type="l", col="red")
    lines(dateTime, subsetData$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    dev.off()    
}

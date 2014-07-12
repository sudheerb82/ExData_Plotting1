
Plot1 <- function()
{
    origData <- read.csv(file="household_power_consumption.txt", sep=";", nrows=70000)
    origData$Date <- as.Date(origData$Date, "%d/%m/%Y")

    subsetData <- origData[origData$Date =="2007-02-01" | origData$Date == "2007-02-02",]
    subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
    
    hist(subsetData$Global_active_power/500, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
    dev.copy(png, file = "Plot1.png", width=480, height=480)
    dev.off()    
}

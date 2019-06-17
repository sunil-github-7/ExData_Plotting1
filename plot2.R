getwd()
setwd("D:/")
data = read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## convert to corresponding datatype
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data$Time = format(data$Time, format="%H:%M:%S")
data$Global_active_power = as.numeric(data$Global_active_power)
data$Global_reactive_power = as.numeric(data$Global_reactive_power)
data$Voltage = as.numeric(data$Voltage)
data$Global_intensity = as.numeric(data$Global_intensity)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

## Filter data from feb 1 and Feb 2 2007
subsetdata = subset(data, Date == "2007-02-01" | Date =="2007-02-02")


datetime = paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Datetime = as.POSIXct(datetime)

## plot  global active power vs DateTime
plot(subsetdata$Global_active_power~ subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png", width=480, height=480)

dev.off()
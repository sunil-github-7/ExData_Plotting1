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

## plot histogram of global active power - feb 1 and Feb 2 2007
png("plot1.png", width=920, height=920)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
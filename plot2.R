#Read data
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';',stringsAsFactors = FALSE,dec = '.')
data2 <- subset(data,data$Date == '1/2/2007'|data$Date == '2/2/2007')
data3 <- subset(data2,data2$Voltage !='?')

#Plot 2
global_active_power <- as.numeric(data3$Global_active_power)
datetime <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png",width = 480,height = 480)
plot(datetime, global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()
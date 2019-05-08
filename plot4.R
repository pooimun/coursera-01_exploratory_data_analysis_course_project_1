#Read data
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';',stringsAsFactors = FALSE,dec = '.')
data2 <- subset(data,data$Date == '1/2/2007'|data$Date == '2/2/2007')
data3 <- subset(data2,data2$Voltage !='?')

#Plot 4
global_active_power <- as.numeric(data3$Global_active_power)
global_reactive_power <- as.numeric(data3$Global_reactive_power)
voltage <- as.numeric(data3$Voltage)
Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
Sub_metering_3 <- as.numeric(data3$Sub_metering_3)
datetime <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png",width = 480,height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power,type='l',xlab='',ylab='Global Active Power')
plot(datetime, voltage,type='l',xlab='datetime',ylab='Voltage')


plot(datetime, Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(datetime, Sub_metering_2,type='l',col='red')
lines(datetime, Sub_metering_3,type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,lwd=2.5,col=c('black','red','blue'))

plot(datetime, global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
dev.off()


#Read data
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';',stringsAsFactors = FALSE,dec = '.')
data2 <- subset(data,data$Date == '1/2/2007'|data$Date == '2/2/2007')
data3 <- subset(data2,data2$Voltage !='?')

#Plot 3
Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
Sub_metering_3 <- as.numeric(data3$Sub_metering_3)
datetime <- strptime(paste(data3$Date, data3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png",width = 480,height = 480)
plot(datetime, Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(datetime, Sub_metering_2,type='l',col='red')
lines(datetime, Sub_metering_3,type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,lwd=2.5,col=c('black','red','blue'))
dev.off()



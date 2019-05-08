#Read data
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';',stringsAsFactors = FALSE,dec = '.')
data2 <- subset(data,data$Date == '1/2/2007'|data$Date == '2/2/2007')
data3 <- subset(data2,data2$Voltage !='?')

#Plot 1
global_active_power <- as.numeric(data3$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()
data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", colClasses="character", sep=";")
startdate = as.Date("2/1/07", format="%m/%d/%y")
enddate = as.Date("2/2/07", format="%m/%d/%y")
datad <- subset(data,as.Date(data$Date, format="%d/%m/%Y") == startdate 
                | as.Date(data$Date, format="%d/%m/%Y") == enddate)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#top left
gap = na.omit(datad$Global_active_power)
plot(gap, typ='l',
     ylab='Global Active Power (kilowatts)',
     xlab='',
     axes=FALSE)
axis(1, at=c(1,1400,2800), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))
box()

#top right
voltage = na.omit(datad$Voltage)
plot(voltage, typ='l', col='black',
     ylab='Voltage',
     xlab='datetime',
     xaxt='n')
axis(1, at=c(1,1400,2800), lab=c("Thu","Fri","Sat"))
box()

#bottom left
sm1 = na.omit(datad$Sub_metering_1)
sm2 = na.omit(datad$Sub_metering_2)
sm3 = na.omit(datad$Sub_metering_3)
plot(sm1, typ='l', col='black',
     ylab='Global Sub Metering',
     xlab='', 
     ylim=c(0,40),
     axes=FALSE)
par(new=TRUE)
plot(sm2, typ='l', col='red',
     ylab='Global Sub Metering',
     xlab='',
     ylim=c(0,40),
     axes=FALSE)
par(new=TRUE)
plot(sm3, typ='l', col='blue',
     ylab='Global Sub Metering',
     xlab='',
     ylim=c(0,40),
     axes=FALSE)
axis(1, at=c(1,1400,2800), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))
legend("topright", col=c('black','red','blue'),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
box()

#bottom right
grp = na.omit(datad$Global_reactive_power)
plot(grp, typ='l', col='black',
     ylab='Global_reactive_power',
     xlab='datetime',
     xaxt='n')
axis(1, at=c(1,1400,2800), lab=c("Thu","Fri","Sat"))
box()
dev.off()
data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", colClasses="character", sep=";")
startdate = as.Date("2/1/07", format="%m/%d/%y")
enddate = as.Date("2/2/07", format="%m/%d/%y")
datad <- subset(data,as.Date(data$Date, format="%d/%m/%Y") == startdate 
                | as.Date(data$Date, format="%d/%m/%Y") == enddate)
sm1 = na.omit(datad$Sub_metering_1)
sm2 = na.omit(datad$Sub_metering_2)
sm3 = na.omit(datad$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
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
dev.off()
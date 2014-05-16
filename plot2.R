data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", colClasses="character", sep=";")
startdate = as.Date("2/1/07", format="%m/%d/%y")
enddate = as.Date("2/2/07", format="%m/%d/%y")
datad <- subset(data,as.Date(data$Date, format="%d/%m/%Y") == startdate 
                | as.Date(data$Date, format="%d/%m/%Y") == enddate)
dates = na.omit(datad$Date)
gap = na.omit(datad$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(gap, typ='l',
     ylab='Global Active Power (kilowatts)',
     xlab='',
     axes=FALSE)
axis(1, at=c(1,1400,2800), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))
box()
dev.off()
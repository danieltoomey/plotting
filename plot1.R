data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", colClasses="character", sep=";")
startdate = as.Date("2/1/07", format="%m/%d/%y")
enddate = as.Date("2/2/07", format="%m/%d/%y")
datad <- subset(data,as.Date(data$Date, format="%d/%m/%Y") == startdate 
                   | as.Date(data$Date, format="%d/%m/%Y") == enddate)
gap = na.omit(datad$Global_active_power)
freq = table(gap) 
png("plot1.png", width = 480, height = 480)
hist(freq,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylim=c(0,1200),       
     br=20, 
     col=c("red"))
dev.off()
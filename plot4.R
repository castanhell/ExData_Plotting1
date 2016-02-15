#Author: Lucas
#This is plot 4
#It presumes the household_power_consumption.txt file is on the current directory

#Opens the png devie it will save
png(file="plot4.png",width=480,height=480, bg="transparent")

#A quick hint from http://stackoverflow.com/questions/23543825/r-read-table-how-to-get-header-and-skip-lines
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = 1, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)
dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]

#
# Plotting figure 4
#
#Sets syslocale to US (I am in Brazil)
Sys.setlocale("LC_TIME","C")
dat$fulldatetime <- paste(dat$Date , dat$Time)
dat$fulldatetime <- strptime(as.character(dat$fulldatetime), "%d/%m/%Y %H:%M:%S")
#Extracts full cases
#dat <- complete.cases(dat)

par(mfrow=c(2,2))

#First: same as plot 2
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
plot(dat$fulldatetime, dat$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power" )
lines(dat$fulldatetime, dat$Global_active_power)

#Second: voltage vs time 
dat$Voltage <- as.numeric(as.character(dat$Voltage))
plot(dat$fulldatetime, dat$Voltage, type = "n", xlab = "datetime", ylab = "Voltage" )
lines(dat$fulldatetime, dat$Voltage)

#Third: same as plot 3
#Converts all types to numeric
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))
#Plots data
plot(dat$fulldatetime, dat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )
lines(dat$fulldatetime, dat$Sub_metering_1, col="black")
lines(dat$fulldatetime, dat$Sub_metering_2, col="red")
lines(dat$fulldatetime, dat$Sub_metering_3, col="blue")
legend( "topright" , lty= 1 , col = c( "black" , "red", "blue" ), legend = c( "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3" ))

#Fourth: Time vs reactive power
dat$Global_reactive_power<- as.numeric(as.character(dat$Global_reactive_power))
plot(dat$fulldatetime, dat$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"  )
lines(dat$fulldatetime, dat$Global_reactive_power)
  
#Don't forget to shut the dev it down!
dev.off()
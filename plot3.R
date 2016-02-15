#Author: Lucas
#This is plots 3
#It presumes the household_power_consumption.txt file is on the current directory

#Opens the png devie it will save
png(file="plot3.png",width=480,height=480, bg="transparent")

#A quick hint from http://stackoverflow.com/questions/23543825/r-read-table-how-to-get-header-and-skip-lines
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = 1, header = FALSE, sep =';')

#give colnames and filters
colnames( dat ) <- unlist(header)
dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]
#
# Plotting figure 3
#
#Sets syslocale to US (I am in Brazil)
Sys.setlocale("LC_TIME","C")
dat$fulldatetime <- paste(dat$Date , dat$Time)
dat$fulldatetime <- strptime(as.character(dat$fulldatetime), "%d/%m/%Y %H:%M:%S")

#Converts all types to numeric
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))

#Sets 1 row and 1 column
par(mfrow=c(1,1))
#Plots
plot(dat$fulldatetime, dat$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )
lines(dat$fulldatetime, dat$Sub_metering_1, col="black")
lines(dat$fulldatetime, dat$Sub_metering_2, col="red")
lines(dat$fulldatetime, dat$Sub_metering_3, col="blue")
legend( "topright" , lty= 1 , col = c( "black" , "red", "purple" ), legend = c( "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3" ))

#Saves figure as png
#480x480 is the default dimensions, so it's good to go
#Don't forget to shut it down!
dev.off()
#Author: Lucas
#This is plots 2
#It presumes the household_power_consumption.txt file is on the current directory

#Opens the device
png(file="plot2.png",bg="transparent")

#A quick hint from http://stackoverflow.com/questions/23543825/r-read-table-how-to-get-header-and-skip-lines
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = 1, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)
dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]
#
# Plotting figure 2
#
#Sets syslocale to US (I am in Brazil)
Sys.setlocale("LC_TIME","C")
dat$fulldatetime <- paste(dat[,]$Date , dat[,]$Time)
dat$fulldatetime <- strptime(as.character(dat$fulldatetime), "%d/%m/%Y %H:%M:%S")

dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
#clears the mfrow param
par(mfrow = c(1,1))
plot(dat$fulldatetime, dat$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)" )
lines(dat$fulldatetime, dat$Global_active_power)

#480x480 is the default dimensions, so it's good to go
#Don't forget to shut it down!
dev.off()
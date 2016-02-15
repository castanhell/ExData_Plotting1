#Author: Lucas
#This is plot 1
#It presumes the household_power_consumption.txt file is on the current directory

#Opens the png device
png(file="plot1.png",bg="transparent")

#A quick hint from http://stackoverflow.com/questions/23543825/r-read-table-how-to-get-header-and-skip-lines
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = 1, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)
dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"), ]
#sets 1 column and one row only
par(mfrow=c(1,1))
#plots the histogram
hist(as.numeric(as.character(dat$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", bg="transparent")
#480x480 is the default dimensions, so it's good to go
#Don't forget to shut the dev down!
dev.off()
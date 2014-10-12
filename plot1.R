plot1 <- function()
{
	library(dplyr) ## For tbl_df function
	
	col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	col_classes = c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
	
	pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, col.names=col_names, colClasses=col_classes)
	
	pc.tbl = tbl_df(pc)
	pc.tbl$Date = as.Date(pc.tbl$Date, format="%d/%m/%Y")
	
	png(file="plot1.png", width = 480, height = 480)
	with(pc.tbl, hist(pc.tbl$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", labels=seq(0,6,by=2), breaks=14))
	dev.off()
	
}


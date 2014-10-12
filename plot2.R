plot2 <- function()
{
	library(dplyr) ## For tbl_df function
	
	col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	col_classes = c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
	
	pc = read.table("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, col.names=col_names, colClasses=col_classes)
	
	pc.tbl = tbl_df(pc)  ## pc stands for Power Consumption
	
	pc.tbl = mutate(pc.tbl, DateTime = paste(pc.tbl$Date, pc.tbl$Time, sep=' '))
	
	pc.tbl$DateTime = strptime(pc.tbl$DateTime, format="%d/%m/%Y %H:%M:%S")
	
	png(file="plot2.png", width = 480, height = 480)
	with(pc.tbl, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
	dev.off()
	
}

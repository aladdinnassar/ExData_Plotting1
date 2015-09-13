#Reference: http://stackoverflow.com/questions/6592219/read-csv-from-specific-row
#install.packages("sqldf")
#library(sqldf)

plot2 <- function(){
    # Read rows for Feb. 1 and 2, 2007
	data <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'");
    
	# Paste Date+Time Columns -> DateTime Column
	data$DateTime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
    
	# Set PNT output 480 x 480 pixels
	png(file = "plot2.png", width = 480, height = 480);
    
	# Plot graph
	plot(data$DateTime,data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
	# Close Device
	dev.off()
}

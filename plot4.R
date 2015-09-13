#Reference: http://stackoverflow.com/questions/6592219/read-csv-from-specific-row
#install.packages("sqldf")
#library(sqldf)

plot4 <- function(){
	# Read rows for Feb. 1 and 2, 2007
    data <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'");
    
	# Paste Date+Time Columns -> DateTime Column
	data$DateTime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
    
	# Set PNT output 480 x 480 pixels
	png(file = "plot4.png", width = 480, height = 480);
    
	# Set 2 x 2 Graph canvas and reduce margins
    par(mfrow = c(2,2), mar = c(4,4,2,2))
    
	with(data, {
		# Plot Graph #1
        plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
		
		# Plot Graph #2
        plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
		# Plot Graph #3
        plot(data$DateTime,data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
        lines(data$DateTime,data$Sub_metering_1, col = "grey")
        lines(data$DateTime,data$Sub_metering_2, col = "red")
        lines(data$DateTime,data$Sub_metering_3, col = "blue")
        legend("topright", bty = "n", lty = 1, col = c("grey","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
		# Plot Graph #4
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
    })
    
    # Close Device
	dev.off()
}

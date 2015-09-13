#Reference: http://stackoverflow.com/questions/6592219/read-csv-from-specific-row
#install.packages("sqldf")
#library(sqldf)

plot3 <- function(){
    # Read rows for Feb. 1 and 2, 2007
	data <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'");
    
	# Paste Date+Time Columns -> DateTime Column
	data$DateTime <- strptime(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
    
	# Set PNT output 480 x 480 pixels
	png(file = "plot3.png", width = 480, height = 480);
    
    # Plot emty graph
	plot(data$DateTime,data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    
	# Add grey line
	lines(data$DateTime,data$Sub_metering_1, col = "grey")
	
	# Add red line
    lines(data$DateTime,data$Sub_metering_2, col = "red")
	
	# Add blue line
    lines(data$DateTime,data$Sub_metering_3, col = "blue")
	
	# Add Legend
    legend("topright", lty = 1, col = c("grey","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             
	# Close Device
    dev.off()
}

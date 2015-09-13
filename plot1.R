#Reference: http://stackoverflow.com/questions/6592219/read-csv-from-specific-row
#install.packages("sqldf")
#library(sqldf)

plot1 <- function(){
	# Read rows for Feb. 1 and 2, 2007
    data <- read.csv.sql("household_power_consumption.txt", sep=";", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'");
    
	# Set PNT output 480 x 480 pixels
	png(file = "plot1.png", width = 480, height = 480);
	
	# Plot histogram
    hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = 'Global Active Power', col = 'red')
    
	# Close Device
	dev.off()
}

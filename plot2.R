data <- read.csv2(file = "household_power_consumption.txt", sep = ";" , stringsAsFactors =  FALSE )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_to_be_used <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
data_to_be_used <- mutate(data_to_be_used, date_time = paste(data_to_be_used$Date, data_to_be_used$Time, sep =" "))
data_to_be_used$date_time <- strptime(data_to_be_used$date_time, "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(data_to_be_used, plot(date_time,Global_active_power, type = "n" , ylab = "Global Active Power (kilowatts)" , xlab = ""))
with(data_to_be_used, lines(date_time,Global_active_power, type="l" ))
dev.off()
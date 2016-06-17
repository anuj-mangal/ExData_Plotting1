data <- read.csv2(file = "household_power_consumption.txt", sep = ";" , stringsAsFactors =  FALSE )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_to_be_used <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(data_to_be_used, hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
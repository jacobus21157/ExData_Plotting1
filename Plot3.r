## Exploratory Data Plot3
## Using Data tables to read in the source data
library(data.table)
hpc <- fread("household_power_consumption.txt", sep = ";", header = TRUE)

## Converting the Date column to Date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Subsetting the data based on Date
hpc_small <- hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"),]

## Creating POSIX dates
hpc_small$daytime <- as.POSIXct(strptime(paste(hpc_small$Date, hpc_small$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))

## Converting data to numeric 
hpc_small$Sub_metering_1 <- as.numeric(hpc_small$Sub_metering_1)
hpc_small$Sub_metering_2 <- as.numeric(hpc_small$Sub_metering_2)
hpc_small$Sub_metering_3 <- as.numeric(hpc_small$Sub_metering_3)

## Create plot and PNG
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(hpc_small, plot(daytime, Sub_metering_1, type = "l", xlab="", ylab= "Energy sub metering"))
with(hpc_small, points(daytime, Sub_metering_2, type ="l", col="red"))
with(hpc_small, points(daytime, Sub_metering_3, type= "l", col="blue"))
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()

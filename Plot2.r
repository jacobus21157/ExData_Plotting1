## Exploratory Data Plot2
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
hpc_small$Global_active_power <- as.numeric(hpc_small$Global_active_power)

## Create plot and PNG
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(hpc_small,
     plot(daytime,
          Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))
dev.off() 
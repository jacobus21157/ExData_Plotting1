## Exploratory Data Plot1
## Using Data tables to read in the source data
library(data.table)
hpc <- fread("household_power_consumption.txt", sep = ";", header = TRUE)

## Converting the Date column to Date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Subsetting the data based on Date
hpc_small <- hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"),]

## Converting data to numeric 
hpc_small$Global_active_power <- as.numeric(hpc_small$Global_active_power)

## Create Histogram

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(hpc_small$Global_active_power,  
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

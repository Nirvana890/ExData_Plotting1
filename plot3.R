#Plot 3

#Load in data
library(readr)
household_power_consumption <- read_delim("C:/Users/nkist/Downloads/exdata_data_household_power_consumption.zip", 
                                          delim = ";", escape_double = FALSE, trim_ws = TRUE)
#Subset two days from feburary 2007
PowerData <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"), ]

#Formatting date and time data
date_col = as.Date(PowerData$Date, format = "%d/%m/%Y")
time_col = strptime(PowerData$Time, format = "%H:%M:%S")
time = as.POSIXct(paste(date_col,PowerData$Time))

#Plotting time vs Energy Sub Metering
plot(time, as.numeric(as.character(PowerData$Sub_metering_1)), xlab = "" , ylab = "Energy Sub Metering", type="l")
lines(time, as.numeric(as.character(PowerData$Sub_metering_2)), col = "red")
lines(time, as.numeric(as.character(PowerData$Sub_metering_3)), col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
#Plot 4

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

par(mfcol = c(2,2))

#Plotting time vs Global Active Power
plot(time, as.numeric(as.character(PowerData$Global_active_power)),xlab = "", ylab = "Global Active Power(Kilowatts)", type="l")

#Plotting time vs Energy Sub Metering
plot(time, as.numeric(as.character(PowerData$Sub_metering_1)), xlab = "" , ylab = "Energy Sub Metering", type="l")
lines(time, as.numeric(as.character(PowerData$Sub_metering_2)), col = "red")
lines(time, as.numeric(as.character(PowerData$Sub_metering_3)), col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),cex = 0.7, lty = 1, bty = "n")

#Plotting time vs Voltage
plot(time, as.numeric(as.character(PowerData$Voltage)),xlab = "datetime", ylab = "Voltage", type="l")

# Plotting time vs Global Reactive Power
plot(time, as.numeric(as.character(PowerData$Global_reactive_power)),xlab = "datetime", ylab = "Global_reactive_power", type="l")




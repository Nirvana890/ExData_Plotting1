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

#Plotting time vs Global Active Power
plot(time, as.numeric(as.character(PowerData$Global_active_power)),xlab = "", ylab = "Global Active Power(Kilowatts)", type="l")

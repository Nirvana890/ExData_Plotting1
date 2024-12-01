#Plot 1

#Load in data
library(readr)
household_power_consumption <- read_delim("C:/Users/nkist/Downloads/exdata_data_household_power_consumption.zip", 
                                                      delim = ";", escape_double = FALSE, trim_ws = TRUE)
#Subset two days from feburary 2007
PowerData <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"), ]

#Plot Histogram for Global Active Power
hist( as.numeric(as.character(PowerData$Global_active_power)), col="red",
      main = "Global Active Power", xlab = "Global Active Power(Kilowatts)")


hpc<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
library(dplyr)
hpc<- hpc %>%
  filter(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc$Date<- as.Date(hpc$Date, "%d/%m/%Y")
library(tidyr)
hpc <- unite(hpc, col = "DateTime", c("Date", "Time"), sep =  " ")
hpc$DateTime<- strptime(hpc$DateTime, format = "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <-as.character(hpc$Global_active_power)
hpc$Global_active_power <-as.numeric(hpc$Global_active_power)
hist(hpc$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
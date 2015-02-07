
# Load Library files

library(data.table)

# set Varaiable class
vars <- c("character", "character", rep("numeric", 7))

# Read table and remove "?" while removing the data
df <- read.table('household_power_consumption.txt', h = 1, sep=";", colClasses=vars, na.strings="?")
head(df)
str(df)

# convert 'Date'  column type to Date using as.date function
df$Date <- as.Date(df$Date, format='%d/%m/%Y')

# convert 'Time'  column type to POSIXlt using strptime function
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset the Data for the dates 2007-02-01 and 2007-02-02
dfsubset <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]

###########################################################
#Plot-4
###########################################################
# output to a png file
png(file="plot4.png",width=480,height=480,units = "px", bg = "transparent")

# Devide the window in to 4 sections 2 x 2
par(mfrow = c(2,2))
#Plot-4.1
plot(dfsubset$Time, dfsubset$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#Plot -4.2
plot(dfsubset$Time, dfsubset$Voltage, 
     type = "l",
     xlab = "",
     ylab = "Voltage")

#Plot -4.3
plot(dfsubset$Time, dfsubset$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(dfsubset$Time, dfsubset$Sub_metering_2, col = "red")
lines(dfsubset$Time, dfsubset$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

#Plot -4.4
plot(dfsubset$Time, dfsubset$Global_reactive_power, 
     type = "l",
     xlab = "Datetime",
     ylab = "Global_reactive_power")
dev.off()


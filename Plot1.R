
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
#Plot-1
###########################################################
png(file="plot1.png",width=480,height=480,units = "px", bg = "transparent")
hist(dfsubset$Global_active_power, 
     xlab = "Global Active Power(killowatts)",
     breaks = 12, col = "red", 
     main="Global Active Power")
dev.off()

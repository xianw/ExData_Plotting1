## set you working directory

setwd("C:/Xianw/Training/Exploratory_Data_Analysis/Project1")

## loading the dataset into R
data_file <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

## Use as.Date functions to convert the column "Date" to calendar dates. 
data_file$Date <- as.Date(data_file$Date, format = "%d/%m/%Y")


## Select the data between "2007-02-01" and "2007-02-02"
data <- subset(data_file, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))



## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Generating Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())

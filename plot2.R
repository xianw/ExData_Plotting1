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


## Generating Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")


## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png has been saved in", getwd())


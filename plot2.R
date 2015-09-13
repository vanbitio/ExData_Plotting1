data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date2 <- as.Date(data$Date,"%d/%m/%Y")
data$Time2 <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
z <- data[data$Date2=="2007-02-02"|data$Date2=="2007-02-01", ]
x <- z$Time2
y <- as.numeric(as.character(z$Global_active_power))

plot(
        x,
        y, 
        type="l",
        xlab="", 
        ylab="Global Active Power (kilowatts)"
     )

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
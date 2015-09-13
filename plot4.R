data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date2 <- as.Date(data$Date,"%d/%m/%Y")
data$Time2 <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
z <- data[data$Date2=="2007-02-02"|data$Date2=="2007-02-01", ]
x <- z$Time2
y1 <- as.numeric(as.character(z$Global_active_power))
y2 <- as.numeric(as.character(z$Voltage))
y3 <- as.numeric(as.character(z$Sub_metering_1))
y4 <- as.numeric(as.character(z$Sub_metering_2))
y5 <- as.numeric(as.character(z$Sub_metering_3))
y6 <- as.numeric(as.character(z$Global_reactive_power))

## Plot gridspace
par(mfrow = c(2, 2))

## First plot
plot(
        x,
        y1, 
        type="l",
        xlab="", 
        ylab="Global Active Power"
     )

## Second plot
plot(
    x,
    y2, 
    type="l",
    xlab="datetime", 
    ylab="Voltage"
)

## Third plot
plot(
    x,
    y3, 
    type="l",
    xlab="", 
    ylab="Energy sub metering"
)
points(
        x,
        y4, 
        type="l",
        col="red"
)
points(
        x,
        y5, 
        type="l",
        col="blue"
)
legend(
        "topright",
        lty=1, 
        col=c("black", "red", "blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        bty = "n"
)    

## Forth plot
plot(
    x,
    y6, 
    type="l",
    xlab="datetime", 
    ylab="Global_reactive_power"
)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
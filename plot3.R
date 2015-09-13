data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date2 <- as.Date(data$Date,"%d/%m/%Y")
data$Time2 <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
z <- data[data$Date2=="2007-02-02"|data$Date2=="2007-02-01", ]
x <- z$Time2
y1 <- as.numeric(as.character(z$Sub_metering_1))
y2 <- as.numeric(as.character(z$Sub_metering_2))
y3 <- as.numeric(as.character(z$Sub_metering_3))

plot(
        x,
        y1, 
        type="l",
        xlab="", 
        ylab="Energy sub metering"
     )
points(
        x,
        y2, 
        type="l",
        col="red"
)
points(
        x,
        y3, 
        type="l",
        col="blue"
)
legend(
        "topright",
        lty=1, 
        col=c("black", "red", "blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)    

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
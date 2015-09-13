data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
z <- data[data$Date=="2007-02-02"|data$Date=="2007-02-01", ]
x <- as.numeric(as.character(z$Global_active_power))

hist(
        x, 
        col="red", 
        xlab="Global Active Power (kilowatts)", 
        main="Global Active Power", 
        breaks=seq(from=0, to=7.5, by=0.5)
     )
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
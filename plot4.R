
#Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

mydata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | 
               as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" ,]

mydata$DateTime <- paste(mydata$Date,mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")




legend("topright",lty=1 , col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(mydata, plot(DateTime, Global_active_power, type="l",
                  ylab = "Global Active Power",
                  xlab =""))

with(mydata, plot(DateTime, Voltage, type="l",
                  ylab = "Voltage",
                  xlab ="datetime"))

plot(mydata$DateTime,mydata$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend("topright",lty=1 , col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

with(mydata, plot(DateTime, Global_reactive_power, type="l",
                  xlab ="datetime"))
dev.off()



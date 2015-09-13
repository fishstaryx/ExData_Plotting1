
#Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

mydata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | 
               as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" ,]

mydata$DateTime <- paste(mydata$Date,mydata$Time)
mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")



#Plot 
png(filename = "plot3.png", width = 480, height = 480)

plot(mydata$DateTime,mydata$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend("topright",lty=1 , col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()



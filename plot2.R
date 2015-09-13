
#Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

mydata <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | 
               as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" ,]

mydata$DateTime <- paste(mydata$Date,mydata$Time)

mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")

#Plot 
png(filename = "plot2.png", width = 480, height = 480)

with(mydata, plot(DateTime, Global_active_power, type="l",
                  ylab = "Global Active Power (kilowatts)",
                  xlab =""))

dev.off()



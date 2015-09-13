
#Read the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
mydata <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02" ,]

#Plot 
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(mydata$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()



data = read.table("household_power_consumption.txt",sep=";",header=TRUE)   
data = subset(data, Date %in% c("1/2/2007","2/2/2007"))
data$newtime = strptime(paste(data$Date,data$Time,sep=" ")
                        , "%e/%m/%Y %T")
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
data$Voltage = as.numeric(as.character(data$Voltage))

png("plot4.png",width=1920,height=1920,res=288)
par(mfcol=c(2,2))
#plot plot2 in top left
with(data,plot(newtime, Global_active_power,type="n"
               ,xlab="",ylab="Global Active Power (kilowatts)"))
lines(data$newtime,data$Global_active_power)
#plot plot3 in bottom left
with(data,plot(newtime, Sub_metering_1,type="n"
               ,xlab="",ylab="Energy sub metering"))
lines(data$newtime,data$Sub_metering_1)
lines(data$newtime,data$Sub_metering_2,col="red")
lines(data$newtime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lty=1,bty="n")
#plot Voltage in top right
with(data,plot(newtime, Voltage,type="n",xlab="datetime",ylab="Voltage"))
lines(data$newtime,data$Voltage)
#plot global reactive power in bottom right
with(data,plot(newtime, Global_reactive_power
               ,type="n",xlab="datetime",ylab="Global_reactive_power"))
lines(data$newtime,data$Global_reactive_power)
dev.off()



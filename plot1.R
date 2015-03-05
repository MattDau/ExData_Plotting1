data = read.table("household_power_consumption.txt",sep=";",header=TRUE)   
data = subset(data, Date %in% c("1/2/2007","2/2/2007"))
data$newtime = strptime(paste(data$Date,data$Time,sep=" ")
                             , "%e/%m/%Y %T")
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
png("plot1.png",width=1920,height=1920,res=288)
hist(data$Global_active_power,col="red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")
dev.off()

       
       
       
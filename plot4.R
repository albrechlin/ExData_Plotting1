hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
filter01<-grep("2007-02-01",hpc$Date)
filter02<-grep("2007-02-02",hpc$Date)
filter0102<-c(filter01,filter02)
hpc0102<-hpc[filter0102,]
hpc0102$Time<-strptime(paste(hpc0102$Date,hpc0102$Time),format="%Y-%m-%d %H:%M:%S")

attach(mtcars)
par(mfrow=c(2,2))
plot(hpc0102$Time,hpc0102$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(hpc0102$Time,hpc0102$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(hpc0102$Time,hpc0102$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(hpc0102$Time,hpc0102$Sub_metering_2,col="red")
lines(hpc0102$Time,hpc0102$Sub_metering_3,col="blue")
legend("top",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n")
plot(hpc0102$Time,hpc0102$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()
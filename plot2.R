hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")
filter01<-grep("2007-02-01",hpc$Date)
filter02<-grep("2007-02-02",hpc$Date)
filter0102<-c(filter01,filter02)
hpc0102<-hpc[filter0102,]
hpc0102$Time<-strptime(paste(hpc0102$Date,hpc0102$Time),format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
plot(hpc0102$Time,hpc0102$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
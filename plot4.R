datas = read.table("household_power_consumption.txt", sep=";")
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
subdatas$datetime = strptime(paste(as.character(subdatas[,1]), as.character(subdatas[,2])), "%d/%m/%Y %H:%M:%S")
subdatas = subdatas[order(subdatas$datetime),]
png("plot4.png", width=480, height=480, units="px")
par(fig=c(0,0.5,0.5,1))
plot(subdatas$datetime, as.double(as.character(subdatas[, 3])), type="l", xlab="", ylab="Global Active Power")
par(fig=c(0.5,1,0.5,1), new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 5])), type="l", xlab="", ylab="Voltage")
par(fig=c(0,0.5,0,0.5), new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 7])), type="l", xlab="", ylab="", col="black", ylim=c(0,38))
par(fig=c(0,0.5,0,0.5), new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 8])), type="l", xlab="", ylab="", col="red", ylim=c(0,38))
par(fig=c(0,0.5,0,0.5), new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 9])), type="l", xlab="", ylab="Energy sub metering", col="blue", ylim=c(0,38))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n", cex=0.7)
par(fig=c(0.5,1,0,0.5), new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 4])), type="l", xlab="", ylab="Global_reactive_power")
dev.off()

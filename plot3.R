datas = read.table("household_power_consumption.txt", sep=";")
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
subdatas$datetime = strptime(paste(as.character(subdatas[,1]), as.character(subdatas[,2])), "%d/%m/%Y %H:%M:%S")
subdatas = subdatas[order(subdatas$datetime),]
png("plot3.png", width=480, height=480, units="px")
plot(subdatas$datetime, as.double(as.character(subdatas[, 7])), type="l", xlab="", ylab="", col="black", ylim=c(0,38))
par(new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 8])), type="l", xlab="", ylab="", col="red", ylim=c(0,38))
par(new=T)
plot(subdatas$datetime, as.double(as.character(subdatas[, 9])), type="l", xlab="", ylab="Energy sub metering", col="blue", ylim=c(0,38))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()


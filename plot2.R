datas = read.table("household_power_consumption.txt", sep=";")
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
subdatas$datetime = strptime(paste(as.character(subdatas[,1]), as.character(subdatas[,2])), "%d/%m/%Y %H:%M:%S")
subdatas = subdatas[order(subdatas$datetime),]
png("plot2.png", width=480, height=480, units="px")
plot(subdatas$datetime, as.double(as.character(subdatas[, 3])), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


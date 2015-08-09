datas = read.table("household_power_consumption.txt", sep=";")
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
png("plot1.png", width=480, height=480, units="px")
hist(as.double(as.character(subdatas[, 3])), xlim=c(0,6), ylim=c(0,1200), breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


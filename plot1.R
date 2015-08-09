# This file should be put in the same directory to household_power_consumption.txt.
# And this file is tested in linux. So I am not sure if there are problems in windows.

#read datas from file
datas = read.table("household_power_consumption.txt", sep=";")
#filter datas
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
#build plot enviroment
png("plot1.png", width=480, height=480, units="px")
#plot content
hist(as.double(as.character(subdatas[, 3])), xlim=c(0,6), ylim=c(0,1200), breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close plot enviroment
dev.off()


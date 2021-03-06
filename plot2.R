# This file should be put in the same directory to household_power_consumption.txt.
# And this file is tested in linux. So I am not sure if there are problems in windows.

#read datas from file
datas = read.table("household_power_consumption.txt", sep=";")
#filter datas
subdatas = subset(datas, V1=="1/2/2007"|V1=="2/2/2007")
#add a new column to save whole datetime
subdatas$datetime = strptime(paste(as.character(subdatas[,1]), as.character(subdatas[,2])), "%d/%m/%Y %H:%M:%S")
#sort datas by datetime
subdatas = subdatas[order(subdatas$datetime),]
#build plot enviroment
png("plot2.png", width=480, height=480, units="px")
#plot content
plot(subdatas$datetime, as.double(as.character(subdatas[, 3])), type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close plot enviroment
dev.off()


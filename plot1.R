#This loads the data.
problemtable<-read.table("F:\\2 - MOOCS\\4 - Exploratory Data Analysis\\Assignments\\Assignment 1\\household_power_consumption.txt", header= TRUE, sep=";",na.strings="?")

#This uses the lubridate package to convert the Data variable to an apporiate object type.
problemtable$Date<-dmy(problemtable$Date)

#This converts the Data column to prepare it to be subsetted.
problemtable[,1]<-as.character(problemtable$Date)

#The following section uses a function to subset the appopriate dates.
date1<-as.character("2007-02-01")
date2<-as.character("2007-02-02")

myfunc <- function(x,y){problemtable[problemtable$Date >= date1 & problemtable$Date <= date2,]}
problemtable2<-myfunc(date1, date2)


#This launches the graphics device, creates the histogram, and closes the .png device.
png(file="plot1.png",width=480, height=480)
hist(problemtable2[,3],col="red", main=paste("Global Active  Power"),xlab="Gobal Active Power (kilowatts)")
dev.off()

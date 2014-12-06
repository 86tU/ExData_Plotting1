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

#This opens the lubridate librate package and creates a new column containing both date and time information.
library(lubridate)
problemtable2$Date<-ymd(problemtable2$Date)

Date.Time<-paste(problemtable2$Date, problemtable2$Time, sep=" ")

#This removes the old date and time columns and replaces them with the new one.
#It then converts the new column again, using the lubridate package, to include the time information.
problemtable3<-problemtable2[,3:9]
problemtable4<-cbind(Date.Time, problemtable3)
problemtable4$Date.Time<-ymd_hms(problemtable4$Date.Time)

#This launches the graphics device, creates the line graph, and closes the .png device.
png(file="plot2.png",width=480, height=480)
with(problemtable4, plot(Date.Time,Global_active_power,xlab=" ",ylab="Gobal Active Power (kilowatts)", type="l"))
dev.off()

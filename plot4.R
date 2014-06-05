plot4 <- function(){
  ## Read the data
  data <- read.table("household_power_consumption.txt",sep = ";", header=T)
  data_plot <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
  ## plot on the screen
  global_active_power <- as.numeric(as.character(data_plot$Global_active_power))
  voltage <- as.numeric(as.character(data_plot$Voltage))
  global_reactive_power <- as.numeric(as.character(data_plot$Global_reactive_power))
    
  sub1<-as.numeric(as.character(data_plot$Sub_metering_1))
  sub2<-as.numeric(as.character(data_plot$Sub_metering_2))
  sub3<-as.numeric(as.character(data_plot$Sub_metering_3))
  
  datetime<-paste(data_plot$Date, data_plot$Time)
  datetime<-as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S")

  par(mfrow=c(2,2),mar = c(4,4,2,2))
  
  plot(datetime, global_active_power, type='s',ylab="Global Active Power", xlab="")
  
  plot(datetime, voltage, type='s',ylab="Voltage", xlab="datetime")
  
  plot(datetime, sub1,xlab="",ylab="Energy sub metering",type="s")
  lines(datetime, sub2,col="red")
  lines(datetime, sub3,col="blue")
  legend("topright",col=c("black","red","blue"),lty="solid",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  plot(datetime, global_reactive_power, type='s',ylab="Global_reactive_power", xlab="datetime")

  ## save as png
  dev.copy(png, file = "plot4.png")
  dev.off()

}
plot2 <- function(){
  ## Read the data
  data <- read.table("household_power_consumption.txt",sep = ";", header=T)
  data_plot <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
  ## plot on the screen
  global_Active_Power <- as.numeric(as.character(data_plot$Global_active_power))
  
  datetime<-paste(data_plot$Date, data_plot$Time)
  datetime<-as.POSIXct(datetime, format="%d/%m/%Y %H:%M:%S")
  
  plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  
  ## save as png
  dev.copy(png, file = "plot2.png")
  dev.off()
  

}
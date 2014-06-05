plot1 <- function(){
  
  ## Read the data
  data <- read.table("household_power_consumption.txt",sep = ";", header=T)
  data_plot <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
  
  ## plot on the screen
  global_Active_Power <- as.numeric(as.character(data_plot$Global_active_power))
  hist(global_Active_Power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",col = "red")
  
  ## save as png
  dev.copy(png, file = "plot1.png")
  dev.off()

}
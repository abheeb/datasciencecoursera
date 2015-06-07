plot4 <- function() {
    par(mfrow = c(2,2))
    
    #code for plot 1
    
    plot2()
    
    #code for plot 2
    
    plot(df$timestamp, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    #code for plot 3
    plot(df$timestamp, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", lwd = 1)
    lines(df$timestamp, df$Sub_metering_2, type = "l", col = "red", lwd= 1)
    lines(df$timestamp, df$Sub_metering_3, type = "l", col = "blue", lwd = 1)
    legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1), bty = "n", cex = 0.5)
   
    #code for plot 4
    plot(df$timestamp, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.copy(png, file = "plot4.png")
    dev.off()
}
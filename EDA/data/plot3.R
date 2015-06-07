plot3 <- function() {
    plot(df$timestamp, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", lwd = 1)
    lines(df$timestamp, df$Sub_metering_2, type = "l", col = "red", lwd= 1)
    lines(df$timestamp, df$Sub_metering_3, type = "l", col = "blue", lwd = 1)
    legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1))
    dev.copy(png, file = "plot3.png")
    dev.off()
}
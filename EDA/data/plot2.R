plot2 <- function() {
    plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.copy(png, file = "plot2.png")
    dev.off()
}
plot1 <- function() {
    hist(df$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
    dev.copy(png, file = "plot1.png")
    dev.off()
}
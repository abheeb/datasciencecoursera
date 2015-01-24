pollutantmean <-function(directory, pollutant, id = 1:332) {
    list_files <- list.files(directory, full.names = TRUE)
    n <- id[1]
    o <- length(id)
    m <- id[o]
    consolidated_data <- data.frame()
    subset_data <- data.frame()
    for (i in n:m) {
        consolidated_data <- rbind(consolidated_data, read.csv(list_files[i]))
    }
    col <- if(pollutant == "sulfate") {
        2
    } else if (pollutant == "nitrate") {
        3
    } else {
        NA
    }
    mean(consolidated_data[, col], na.rm = TRUE)
}
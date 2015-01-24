complete <- function(directory, id = 1:332) {
    list_files <- list.files(directory, full.names = TRUE)
    nobs <- vector()
            for (s in 1:length(id)) {
            nobs[s] <- sum(complete.cases(read.csv(list_files[id[s]])))
            }
    complete_data <- data.frame(id, nobs)
    complete_data
}
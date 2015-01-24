corr <- function (directory, threshold = 0) {
    list_files <- list.files(directory, full.names = TRUE)
    complete_data <- complete(directory)
    subset_complete_data <- complete_data[complete_data$nobs > threshold,]
    id <- subset_complete_data$id
    cor_coe <- vector(mode = "numeric")
    if (is.na(id[1]) == "TRUE") {
        cor_coe
    } else{
            for (i in 1:length(id)) {
                test_file <- read.csv(list_files[id[i]])
                sulfate <- test_file$sulfate
                nitrate <- test_file$nitrate
                cor_coe[i] <- cor(sulfate, nitrate, use = "complete.obs")
            }
        }
    cor_coe
}
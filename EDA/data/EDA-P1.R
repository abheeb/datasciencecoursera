if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
setwd("/Users/abheebrahmnalkar/Desktop/datasciencecoursera/EDA/data") #Changing working directory to the folder where extracted files are
Project_Data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE) #Reading the main file
# changing class to Date
Project_Data$Date <- as.Date(Project_Data$Date, format = "%d/%m/%Y")
df <- Project_Data[(Project_Data$Date == "2007-02-01") | (Project_Data$Date == "2007-02-02"), ]
df$Time <- as.character(df$Time)
# changing class to numeric from factor
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
# combining date and time together to create one timestamp value
df$timestamp <- paste(df$Date, df$Time, format = "%d/%m/%Y %H:%M:%S")
df$timestamp <- as.POSIXct(df$timestamp)
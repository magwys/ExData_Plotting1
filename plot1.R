##############################################################################
# FILE
#   plot1.R
#
# Description: Measurements of electric power consumption in one household with 
# a one-minute sampling rate over a period of almost 4 years. Different electrical 
# quantities and some sub-metering values are available.
#
# Our overall goal here is simply to examine how household energy usage varies over 
# a 2-day period in February, 2007. Your task is to reconstruct the following plots below, 
# all of which were constructed using the base plotting system.
#


##############################################################################
# STEP 0 - Download and unzip the dataset

zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "household_power_consumption.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb", method = "curl")
}

dataPath <- "household_power_consumption.txt"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

##############################################################################
# STEP 1 - Read dataset from data file

data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")


##############################################################################
# STEP 2 - Extract data from the dates 01/02/2007 and 02/02/2007

#data <- data.full[(data.full$Date = "1/2/2007" | data.full$Date = "2/2/2007"),]
data_full <- data_full[data_full$Date %in% c("1/2/2007", "2/2/2007"), ]

##############################################################################
# STEP 3 - Launch PNG file device 

png(file="plot1.png", width = 480, height = 480)

##############################################################################
# STEP 4 - Create plot1

hist(data_full$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

##############################################################################
# STEP 5 - Close PNG file device 

dev.off()



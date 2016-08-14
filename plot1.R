# R code that creates plot 1 for the first Week Assigment of the Course 
# Exploratory Data Analysis for the Coursera especialization Data Science.

## Loads necessary Packages.
library("dplyr")
library("lubridate")

## Getting the dataset. 

### Loads the file containing the dataset in memory and passes it to a data frame for plotting. 
if (!dir.exists("Data")) {dir.create("Data")} # Creates directory for the dataset, if it does not exist. 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" # Passes the URL to a variable.
download.file(url, destfile = "./Data/household_power_consumption.zip", method = "curl") # Download file containing the dataset. (Method "curl" default for Mac operative systems)
date_downloaded <- Sys.Date() # Saves the date that the dataset was downloaded. 
unzip("./Data/household_power_consumption.zip", exdir = "./Data") # Unzips the file containing the dataset.

### Reads the dataset into a csv format and passes its value to a variable.
house_power_consumption <- read.table("./Data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE) 

## Cleaning the dataset. 
subseted_house_power_consumption <- house_power_consumption[house_power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ] # Subsets the dataset in the range 1/2/2007 and 2/2/2006.
subseted_house_power_consumption$Date <- dmy(subseted_house_power_consumption$Date) # Transforms the varible Date from a character vector to a class Date. 

## Plotting 
png("./Data/Plot1.png", width = 480, height = 480, units = "px", bg = FALSE)
hist(subseted_house_power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
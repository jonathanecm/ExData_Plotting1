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
house_power_consumption <- read.table("./Data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE) # Read the dataset into a csv format and pass its value to a variable.

## Cleaning the dataset. 

subseted_house_power_consumption <- house_power_consumption[house_power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ] # Subsets the dataset in the range 1/2/2007 and 2/2/2006.

### Concatenate the character varialbes Date and Time and transforms them into a Date class. 
subseted_house_power_consumption$Full_Date <- strptime(paste(subseted_house_power_consumption$Date, subseted_house_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")  

## Plotting 

png("./Data/Plot2.png", width = 480, height = 480, units = "px", bg = FALSE)
plot(subseted_house_power_consumption$Full_Date, subseted_house_power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

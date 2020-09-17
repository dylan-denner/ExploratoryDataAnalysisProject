##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 1
#
# 1. Have total emissions from PM2.5 decreased in the 
#    United States from 1999 to 2008? Using the base 
#    plotting system, make a plot showing the total PM2.5
#    emission from all sources for each of the years 1999,
#    2002, 2005, and 2008.
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Calculating totals
pm25_total_1999 <- c(sum(subset(NEI$Emissions, NEI$year == 1999)))
pm25_total_2002 <- c(sum(subset(NEI$Emissions, NEI$year == 2002)))
pm25_total_2005 <- c(sum(subset(NEI$Emissions, NEI$year == 2005)))
pm25_total_2008 <- c(sum(subset(NEI$Emissions, NEI$year == 2008)))

### Appending totals to vector 
pm25_list <- c(pm25_total_1999, pm25_total_2002, pm25_total_2005, pm25_total_2008)

### Setting column names
names(pm25_list) <- c("1999", "2002", "2005", "2008")

### Producing plot
print(barplot(pm25_list, ylim = c(0,7350000), main = "Total PM2.5 vs. Year", xlab = "Years", ylab = "Total PM2.5 emission"))


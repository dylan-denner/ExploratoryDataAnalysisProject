##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 2
#
# 2. Have total emissions from PM2.5 decreased in the 
#    Baltimore City, Maryland (fips == "24510") 
#    from 1999 to 2008? Use the base plotting system to 
#    make a plot answering this question.
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Calculating totals
pm25_total_1999 <- c(sum(subset(NEI$Emissions, NEI$year == 1999 & NEI$fips == "24510")))
pm25_total_2002 <- c(sum(subset(NEI$Emissions, NEI$year == 2002 & NEI$fips == "24510")))
pm25_total_2005 <- c(sum(subset(NEI$Emissions, NEI$year == 2005 & NEI$fips == "24510")))
pm25_total_2008 <- c(sum(subset(NEI$Emissions, NEI$year == 2008 & NEI$fips == "24510")))

### Appending totals to vector 
pm25_list <- c(pm25_total_1999, pm25_total_2002, pm25_total_2005, pm25_total_2008)

### Setting column names
names(pm25_list) <- c("1999", "2002", "2005", "2008")

### Producing plot
png(filename="plot2.png")
print(barplot(pm25_list, ylim = c(0,4000), main = "Total PM2.5 In Bal. vs. Year", xlab = "Years", ylab = "Total PM2.5 emission in Bal."))
dev.off()

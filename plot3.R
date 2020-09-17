##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 3
#
# 3. Of the four types of sources indicated by the type 
#    (point, nonpoint, onroad, nonroad) variable, which
#    of these four sources have seen decreases in emissions
#    from 1999-2008 for Baltimore City? Which have seen 
#    increases in emissions from 1999-2008? Use the ggplot2
#    plotting system to make a plot answer this question.
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Calculating totals
pm25_total_1999_point <- c(sum(subset(NEI$Emissions, NEI$year == 1999 & NEI$fips == "24510" & NEI$type == "POINT")))
pm25_total_2002_point <- c(sum(subset(NEI$Emissions, NEI$year == 2002 & NEI$fips == "24510" & NEI$type == "POINT")))
pm25_total_2005_point <- c(sum(subset(NEI$Emissions, NEI$year == 2005 & NEI$fips == "24510" & NEI$type == "POINT")))
pm25_total_2008_point <- c(sum(subset(NEI$Emissions, NEI$year == 2008 & NEI$fips == "24510" & NEI$type == "POINT")))


pm25_total_1999_nonpoint <- c(sum(subset(NEI$Emissions, NEI$year == 1999 & NEI$fips == "24510" & NEI$type == "NONPOINT")))
pm25_total_2002_nonpoint <- c(sum(subset(NEI$Emissions, NEI$year == 2002 & NEI$fips == "24510" & NEI$type == "NONPOINT")))
pm25_total_2005_nonpoint <- c(sum(subset(NEI$Emissions, NEI$year == 2005 & NEI$fips == "24510" & NEI$type == "NONPOINT")))
pm25_total_2008_nonpoint <- c(sum(subset(NEI$Emissions, NEI$year == 2008 & NEI$fips == "24510" & NEI$type == "NONPOINT")))

pm25_total_1999_ON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 1999 & NEI$fips == "24510" & NEI$type == "ON-ROAD")))
pm25_total_2002_ON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2002 & NEI$fips == "24510" & NEI$type == "ON-ROAD")))
pm25_total_2005_ON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2005 & NEI$fips == "24510" & NEI$type == "ON-ROAD")))
pm25_total_2008_ON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2008 & NEI$fips == "24510" & NEI$type == "ON-ROAD")))

pm25_total_1999_NON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 1999 & NEI$fips == "24510" & NEI$type == "NON-ROAD"), na.rm = TRUE))
pm25_total_2002_NON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2002 & NEI$fips == "24510" & NEI$type == "NON-ROAD")))
pm25_total_2005_NON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2005 & NEI$fips == "24510" & NEI$type == "NON-ROAD")))
pm25_total_2008_NON_ROAD <- c(sum(subset(NEI$Emissions, NEI$year == 2008 & NEI$fips == "24510" & NEI$type == "NON-ROAD")))

### Appending totals to vector 
pm25_list_point <- c(pm25_total_1999_point, pm25_total_2002_point, pm25_total_2005_point, pm25_total_2008_point)
pm25_list_nonpoint <- c(pm25_total_1999_nonpoint, pm25_total_2002_nonpoint, pm25_total_2005_nonpoint, pm25_total_2008_nonpoint)
pm25_list_ON_ROAD <- c(pm25_total_1999_ON_ROAD, pm25_total_2002_ON_ROAD, pm25_total_2005_ON_ROAD, pm25_total_2008_ON_ROAD)
pm25_list_NON_ROAD <- c(pm25_total_1999_NON_ROAD, pm25_total_2002_NON_ROAD, pm25_total_2005_NON_ROAD, pm25_total_2008_NON_ROAD)

### Setting column names
names(pm25_list_point) <- c("1999", "2002", "2005", "2008")
names(pm25_list_nonpoint) <- c("1999", "2002", "2005", "2008")
names(pm25_list_ON_ROAD) <- c("1999", "2002", "2005", "2008")
names(pm25_list_NON_ROAD) <- c("1999", "2002", "2005", "2008")

### Producing plot
png(filename="plot3.png")
par(mfrow=c(2,2))
print(barplot(pm25_list_point, ylim = c(0,1500), main = "Total PM2.5 In Bal. POINT vs. Year", xlab = "Years", ylab = "Total POINT PM2.5 emission"))
print(barplot(pm25_list_nonpoint, ylim = c(0,2500), main = "Total PM2.5 In Bal. NONPOINT vs. Year", xlab = "Years", ylab = "Total NONPOINT PM2.5 emission"))
print(barplot(pm25_list_ON_ROAD, ylim = c(0,400), main = "Total PM2.5 In Bal. ONROAD vs. Year", xlab = "Years", ylab = "Total ONROAD PM2.5 emission"))
print(barplot(pm25_list_NON_ROAD, ylim = c(0,1500), main = "Total PM2.5 In Bal. NONROAD vs. Year", xlab = "Years", ylab = "Total NONROAD PM2.5 emission"))
dev.off()

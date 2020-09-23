##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 5
#
# 6. Compare emissions from motor vehicle sources in Baltimore
#    City with emissions from motor vehicle sources in 
#    Los Angeles County, California. 
#    Which city has seen greater changes over time in motor
#    vehicle emissions?
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
library(reshape2)

vehicles_baltimore_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
vehicles_baltimore_data_by_year <- aggregate(Emissions ~ year, vehicles_baltimore_data, sum)

vehicles_LA_data <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]
vehicles_LA_data_by_year <- aggregate(Emissions ~ year, vehicles_LA_data, sum)

final_data <- data.frame("Year" = vehicles_LA_data_by_year$year, "Emissions_Baltimore" = vehicles_baltimore_data_by_year$Emissions, "Emissions_LA" = vehicles_LA_data_by_year$Emissions)

balt_ <- as.vector(final_data$Emissions_Baltimore)
LA_ <- as.vector(final_data$Emissions_LA)

png("plot6.png")
par(mfrow = c(1,2))
g<-barplot(balt_, col = "red", main = "Baltimore Emissions", xlab = "Year", ylim = c(0,5000))
f<-barplot(LA_, col = "blue", main = "LA Emissions", xlab = "Year", ylim = c(0,5000))
print(g)
print(f)
dev.off()



##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 5
#
# 5. How have emissions from motor vehicle sources changed from
#    1999-2008 in Baltimore City?
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)

vehicles_baltimore_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

vehicles_baltimore_data_by_year <- aggregate(Emissions ~ year, vehicles_baltimore_data, sum)



png("plot5.png")
graph_ <- ggplot(vehicles_baltimore_data_by_year, aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity")
graph_ <- graph_ + xlab("Year") + ylab("Total Baltimore Vehicle Emissions") + ggtitle("Total Baltimore Vehicle Emissions: 1999 - 2008")
print(graph_)
dev.off()

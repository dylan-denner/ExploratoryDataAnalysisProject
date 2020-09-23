##############################################################
#
# Exploratory Data Analysis Project
# Dylan Denner
# Plot 4
#
# 4. Across the United States, how have emissions from coal
#    combustion-related sources changed from 1999-2008?
#
##############################################################

### Reading in data and classifications
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)

coal_vector <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)

coal_data <- NEI[coal_vector, ]

coal_data_by_year <- aggregate(Emissions ~ year, coal_data, sum)



png("plot4.png")
graph_ <- ggplot(coal_data_by_year, aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity")
graph_ <- graph_ + xlab("Year") + ggtitle("Total Coal Emissions: 1999 - 2008")
print(graph_)
dev.off()

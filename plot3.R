# Exploratory Data Analysis - Course Project  -  Q.3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions 
# from 1999-2008 for Baltimore City? Which have seen increases in emissions 
# from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# -----------------------------------------------------------

library(ggplot2)

# Load provided datasets if they are available in the working folder
NEI_datafile <- "summarySCC_PM25.rds"
SCC_datafile <- "Source_Classification_Code.rds"

if ( NEI_datafile %in% dir("./data")){
  NEI <- readRDS(paste("./data/",NEI_datafile, sep="/" ))
  
}

if ( NEI_datafile %in% dir("./data")){
  SCC <- readRDS(paste("./data/",SCC_datafile, sep="/" ))
  
}

# -------------------------------------------------------------

# Totals by Year
# only for Baltimore City, Maryland (fips == "24510")
totals_by_yearNtype_Baltimore <- aggregate( Emissions~year+type
                                       ,NEI,subset = (NEI$fips=="24510")
                                       ,FUN = sum
)

#Open png device in working directory
png("plot3.png", width=580, height=580)


# build plot
g <- ggplot(totals_by_yearNtype_Baltimore, aes(year, Emissions, color = type))
g <- g + geom_line() +
       xlab("year")  +
       ylab(expression("Total Emissions")) +
       ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)

dev.off()

# ---------------------------------------------


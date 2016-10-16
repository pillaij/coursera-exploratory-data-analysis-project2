# Exploratory Data Analysis - Course Project  -  Q.1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
# -----------------------------------------------------------

# Load provided datasets if they are available in the working folder
NEI_datafile <- "summarySCC_PM25.rds"
SCC_datafile <- "Source_Classification_Code.rds"

if ( NEI_datafile %in% dir("./data")){
  NEI <- readRDS(paste("./data/",NEI_datafile, sep="/" ))
  
}

if ( NEI_datafile %in% dir("./data")){
  SCC <- readRDS(paste("./data/",SCC_datafile, sep="/" ))
  
}

# Totals by Year
totals_by_year <- aggregate(Emissions~year, NEI, FUN = sum)

# Convert totals Millions (dividing by 1 Million)
totals_in_million_by_year <- totals_by_year
totals_in_million_by_year$Emissions <- totals_by_year$Emissions/1000000


#Open png device in working directory
png("plot1.png", width=480, height=480)

barplot(height=totals_in_million_by_year$Emissions
        ,names.arg=totals_in_million_by_year$year
        ,xlab="Year", ylab = "Total Emissions (Million Ton)"
        , main = "Yearly Total PM[2.5]* Emissions"
        , ylim = c(0,10))
dev.off()

# ---------------------------------------------


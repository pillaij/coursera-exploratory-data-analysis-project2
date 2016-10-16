# Exploratory Data Analysis - Course Project  -  Q.2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
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

# -------------------------------------------------------------

# Totals by Year
# only for Baltimore City, Maryland (fips == "24510")
totals_by_year_Baltimore <- aggregate( Emissions~year
                                      ,NEI,subset = (NEI$fips=="24510")
                                      ,FUN = sum
                                     )


#Open png device in working directory
png("plot2.png", width=480, height=480)

barplot(height=totals_by_year_Baltimore$Emissions
        ,names.arg=totals_by_year_Baltimore$year
        ,xlab="Year", ylab = "Total Emissions (Ton)"
        , main = "Baltimore - Yearly Total PM[2.5]* Emissions"
        , ylim = c(0,4000)
        )
dev.off()

# ---------------------------------------------


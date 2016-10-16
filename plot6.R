# Exploratory Data Analysis - Course Project  -  Q.6

# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in 
# Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
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



# Totals by Year for Baltimore & type = ON-ROAD
Baltimore_totals_by_year_motor <- aggregate(Emissions~year
                                  ,NEI
                                  ,subset=(fips == '24510' & type == 'ON-ROAD')
                                  ,FUN = sum
)

# Totals by Year for Baltimore & type = ON-ROAD
LA_totals_by_year_motor <- aggregate(Emissions~year
                                            ,NEI
                                            ,subset=(fips == '06037' & type == 'ON-ROAD')
                                            ,FUN = sum
)




#Open png device in working directory
png("plot6.png", width=580, height=580)


par(mfrow=c(1,2), mar = c(4,4,2,1))
# Plot for Baltimore
plot(Baltimore_totals_by_year_motor$year, (Baltimore_totals_by_year_motor$Emissions), type="o" ,ylim=range((Baltimore_totals_by_year_motor$Emissions))
     ,col = "red"
     ,lty="solid", pch=22
     ,ylab = paste('Emissions PM', '[2.5]', ' (ton)')
     ,xlab = "Year"
     ,main = "Baltimore: Vehicle Emissions"
)
# Plot arrow from first to last point
arrows( Baltimore_totals_by_year_motor$year[1],  Baltimore_totals_by_year_motor$Emissions[1], Baltimore_totals_by_year_motor$year[4],  Baltimore_totals_by_year_motor$Emissions[4], code=2, col="blue", lty="dashed")

# Plot for Los Angeles
plot(LA_totals_by_year_motor$year, (LA_totals_by_year_motor$Emissions), type="o" ,ylim=range((LA_totals_by_year_motor$Emissions))
     ,col = "red"
     ,lty="solid", pch=22
     ,ylab = paste('Emissions PM', '[2.5]', ' (ton)')
     ,xlab = "Year"
     ,main = "Los Angeles: Vehicle Emissions"
)
# Plot arrow from first to last point
arrows( LA_totals_by_year_motor$year[1],  LA_totals_by_year_motor$Emissions[1], LA_totals_by_year_motor$year[4],  LA_totals_by_year_motor$Emissions[4], code=2, col="blue", lty="dashed")


dev.off()

# ---------------------------------------------


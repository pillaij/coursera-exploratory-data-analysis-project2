# Exploratory Data Analysis - Course Project  -  Q.5

# How have emissions from motor vehicle sources changed 
# from 1999-2008 in Baltimore City?
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
totals_by_year_motor <- aggregate(Emissions~year
                           ,NEI
                           ,subset=(fips == 24510 & type == 'ON-ROAD')
                           ,FUN = sum
                           )


#Open png device in working directory
png("plot5.png", width=480, height=480)


# build plot
plot( totals_by_year_motor$year, totals_by_year_motor$Emissions
      ,type="o"
      ,lwd=2
      ,col="blue"
      ,main = "Baltimore Motor Vehicle Emissions PM'[2.5]"
      ,xlab = "Year"
      ,ylab = paste('Emissions PM', '[2.5]')
)

dev.off()

# ---------------------------------------------

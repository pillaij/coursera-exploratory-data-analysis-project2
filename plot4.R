# Exploratory Data Analysis - Course Project  -  Q.4

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?
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

# List SCC for Coal
Coal_SCC_list <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]$SCC

# NEI for Coal SCC
NEI_Coal <- subset(NEI,SCC %in% Coal_SCC_list)


# Totals by Year
totals_by_year <- aggregate(Emissions~year, NEI_Coal, FUN = sum)

# Convert totals Kilo tons (dividing by 1000)
totals_in_kiloton_by_year <- totals_by_year
totals_in_kiloton_by_year$Emissions <- totals_by_year$Emissions/1000



#Open png device in working directory
png("plot4.png", width=480, height=480)


# build plot
plot( totals_in_kiloton_by_year$year, totals_in_kiloton_by_year$Emissions
     ,type="o"
     ,lwd=2
     ,col="blue"
     ,main = "Total Emissions of PM'[2.5] for Coalrelated Sources"
     ,xlab = "Year"
     ,ylab = paste('Emissions PM', '[2.5]', ' in kilotons')
    )

dev.off()

# ---------------------------------------------


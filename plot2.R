# Set workign directory
setwd("C:/Users/fcsda/OneDrive/Documents/Exploratory Data Analysis/Data for the lessons")

# Loading the data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset to get data from the dates 2007-02-01 and 2007-02-02 only
subhpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

# Convet the DAte and Time variables to Date/Time classes
subhpc$Date <- as.Date(subhpc$Date, format = "%d/%m/%Y")
subhpc$Time <- strptime(subhpc$Time, format = "%H:%M:%S")
subhpc[1:1440, "Time"] <- format(subhpc[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subhpc[1441:2880, "Time"] <- format(subhpc[1441:2880, "Time"], "2007-02-02 %H:%M:%S")


# Histogram of Global Active Power
plot(subhpc$Time, as.numeric(as.character(subhpc$Global_active_power)), type = 'l', xlab = "",ylab = "Global Active Power (kilowatts)", main = "Global Active Power Vs Time")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
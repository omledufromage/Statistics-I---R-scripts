# Histogram of monthly AIG prices (Sharpe et al. (2015), pp. 78-79)
# Import data set in RStudio: File > Import Dataset... > From Text (base)...
attach(table.3.1)

# To sort the values of Price:
sort(Price)

# The histogram function hist() with all options set to default values:
hist(Price)

# For left-closed, right-open intervals (classes) use the option: right = FALSE  :
hist(Price, right = FALSE)

# To get the information needed to set up a frequency table:
hist(Price, right=FALSE, plot=FALSE)

# To generate a histogram showing counts (Sharpe et al. (2015), figure 3.1 p. 78):
hist(Price, right=FALSE, las=1, col="DarkGreen", xlab="Monthly Average Price ($)", ylab="# of Months", main="", yaxs='i')    

# To find the relative frequencies as percentages and generate a relative frequency histogram
# (Sharpe et al. (2015), figure 3.2 p. 79):
h <- hist(Price,  right = FALSE, plot=FALSE)
h$counts <- 100*h$counts / sum(h$counts)
h$counts  # Display the relative frequencies as percentages
plot(h, freq=TRUE, las=1, xlab="Monthly Average Price ($)", ylab="Relative Frequency (%)", main="",col="Pink", yaxs="i")

# To generate a density histogram (see handout on density histograms):
hist(Price,right = FALSE)$density  # this shows density for each interval
hist(Price, freq=FALSE, right = FALSE, las=1, xlab="Monthly Average Price  ($)", main="",col="grey", yaxs="i")

# To find the mean and median of the AIG prices (p. 84):
mean(Price)
median(Price)

# To generate figure 3.8 p. 84  (histogram of monthly volume of AIG stock traded):
hist(Volume/(10^6), right = FALSE, las=1, xlab="Total Monthly Volume", ylab="# of Months", main="",col="LightGreen", yaxs="i")
# Note: the values of Volume differ from what is shown in figure 3.8 p. 84!


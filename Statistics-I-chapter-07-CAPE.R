# Part 7.1 uses the Cyclically Adjusted Price Earnings Ratio (CAPE) dataset by Robert Shiller 
# (Yale University). This is the same Robert Shiller of speculative bubbles and irrational financial markets 
# we encountered in Introduction to Macroeconomics (chapter 25 of Mankiw & Taylor (2017)). 
# I downloaded the CAPE dataset from Robert Shiller's home page:
#  http://www.econ.yale.edu/~shiller/data.htm
# and extracted from the Excel file a properly formatted comma-separated values file (ie_data_CAPE.csv) (see ie_data_note_to_myself.txt for details)
# I posted the comma-separated values file (ie_data_CAPE.csv) on Canvas.
# Save the file in the  "Statistics I" directory (folder) on your computer. 
# Import the dataset in RStudio: File > Import Dataset > From Text (base)… 

# When you imported the data, enter in the Console:
attach(ie_data_CAPE)
date <- as.Date(Date, "%Y-%m-%d")   # see ie_data_note_to_myself.txt 

# To replicate the time series diagram (fig. 7.1 p. 238):
CAPE.ts <- ts(CAPE,start=c(1871,1),frequency = 12)    # create the time series
plot.ts(CAPE.ts,type="l",las=1,col="blue",frame.plot=FALSE,xlab="",ylab="CAPE10", xaxt="n")
axis(1, at = seq(1880, 2020, by = 20))                # labels on x-axis at 1880, 1900, 1920, ...

CAPE.breaks <- seq(4,48, by = 2)   # breaks at 4, 6, 8, ..., 48
hist(CAPE.ts,breaks=CAPE.breaks,las=1,yaxs="i",xlab="CAPE10",ylab="# of Months",main="",col="darkgreen",freq=TRUE)

# To replicate the histogram of the z-scores (fig. 7.3 p. 239):
mean(CAPE, na.rm=TRUE)    # the option na.rm=TRUE tells R to remove the NAs ("not available") when computing the mean
sd(CAPE, na.rm=TRUE) 
CAPE.z.scores        <- (CAPE       - mean(CAPE, na.rm=TRUE))/sd(CAPE, na.rm=TRUE)
CAPE.z.scores.breaks <- (CAPE.breaks- mean(CAPE, na.rm=TRUE))/sd(CAPE, na.rm=TRUE)
hist(CAPE.z.scores,breaks=CAPE.z.scores.breaks,las=1,yaxs="i",xlab="CAPE10 (z-scores)",ylab="# of Months",main="",col="yellow",freq=TRUE)

# To make a density histogram (that displays the relative frequency as the area of the bars):
hist(CAPE.z.scores,breaks=CAPE.z.scores.breaks,las=1,yaxs="i",xlab="CAPE10 (z-scores)",main="",col="yellow",freq=FALSE)

# Normal probability plot (figure p. 249) (or: Normal Q-Q-plot)
qqnorm(CAPE,las=1 ,pch=20, col="darkorange3")  
qqline(CAPE,lty="dashed")  # if the points are on this line, the data are Normally distributed
qq <- qqnorm(CAPE,plot.it=FALSE)
sort(qq$x)   # Shows the theoretical quantiles (the values on the x-axis of the Normal Q-Q-plot) ordered from small to large

# Normal probability plot (or Normal Q-Q-plot) with sample z-scores on vertical axis: 
qqnorm(CAPE.z.scores,las=1, pch=20, col="darkorange3", asp=1)
qqline(CAPE.z.scores,lty="dashed")  # if the points are on this line, the data are Normally distributed
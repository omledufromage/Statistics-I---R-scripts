# Time series plots (Sharpe et al. (2015), pp. 97--100)
# Import    AIG Stock series.txt    in RStudio: File > Import Dataset > From text (base)...
AIG.Stock.series.2007 <- subset(AIG.Stock.series, Year >= 2007 & Year < 2008)
attach(AIG.Stock.series.2007)

# The as.Date() function is useful to plot time series:
# Figure 3.13 (scatter plot) in Sharpe et al. (2015), p. 98:
# pch = 16: pch = point choice; 16 is a filled circle: https://www.statmethods.net/advgraphs/parameters.html
plot(Close ~ as.Date(Date,"%m/%d/%y"),
     xlab="2007",ylab="Price ($)", las=1,  pch=16, frame.plot=FALSE, col="DarkGreen")

# Figure 3.14 (line diagram) in Sharpe et al. (2015), p. 98:
# The option type="l" generates a line diagram
# The option lwd=2    makes the line twice as wide
plot(Close ~ as.Date(Date,"%m/%d/%y"),
     xlab="2007",ylab="Price ($)", las=1,  type="l", frame.plot=FALSE, lwd=2, col="DarkGreen")

# Figure 3.15 (scatter plot with a smooth trace added):
plot(Close ~ as.Date(Date,"%m/%d/%y"),
     xlab="2007",ylab="Price ($)", pch=16,  las=1, frame.plot=FALSE, col="DarkGreen")
# Add the smooth trace. Experiment with the smoothing parameter spar (takes values between 0 and 1):
smooth.trace <-  smooth.spline(as.Date(Date,"%m/%d/%y"),Close, spar=0.60)
lines(smooth.trace,  col="DarkRed", lwd=3)

# Figure 3.16:
AIG.Stock.series.2008 <- subset(AIG.Stock.series, Year >= 2008 & Year < 2009)
plot(AIG.Stock.series.2008$Close ~ as.Date(AIG.Stock.series.2008$Date,"%m/%d/%y"), xlab="2008",ylab="Price ($)",pch=16, las=1, frame.plot=FALSE,col="DarkRed")
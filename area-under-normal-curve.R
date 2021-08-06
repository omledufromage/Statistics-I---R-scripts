#========================================================
# Area under normal curve 
#        Author: Luc Hens (luc.hens@vub.ac.be)
#        Date:   rev. 28 March 2019
#========================================================
# This script computes the area under the standard 
# normal curve between any two values (Sharpe, De Veaux, 
# and Velleman, 2017, pp. 243-247) and plots the normal curve 
# with the relevant area shaded. 
# ==============================================================
# Enter the values for the lower and upper boundaries:
  x.lower.boundary    <-    -2      # enter value for lower boundary 
  x.upper.boundary    <-     10^99  # enter value for upper boundary 
# ==============================================================
# Don't change anything in the lines below:
area <- pnorm(x.upper.boundary) - pnorm(x.lower.boundary)
area
curve(dnorm(x),las=1,xlim=c(-4,4),ylab="density of z",xlab="Standard score (z)",xaxt="n",frame.plot=FALSE) 
axis(side=1,,pos=0,xaxp=c(-4,4,8))      # x-axis

# To plot the graph, lower.boundaries less than -4 are set to -4, and
#                    upper.boundaries more than  4 are set to  4, and
cord.x <- c(max(x.lower.boundary,-4),seq(max(x.lower.boundary,-4),min(x.upper.boundary, 4),0.01),min(x.upper.boundary, 4)) 
cord.y <- c(0,dnorm(seq(max(x.lower.boundary,-4),min(x.upper.boundary, 4),0.01)),0)
polygon(cord.x,cord.y,col="grey",lty="blank") # shaded area
text(c(1,0.30),pos=2,labels="area=")
text(c(2,0.30),pos=4,labels=as.character(round(area,4)))





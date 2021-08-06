#===============================================================
# Binomial density plot 
#        Author: Luc Hens (luc.hens@vub.ac.be)
#        Date:   28 March 2019
#===============================================================
# This script plots the probability density function (pdf) 
# of a binomial distributionand adds the normal approximation 
# (Sharpe, De Veaux, and Velleman, 2017, pp. 253-255)
# ==============================================================
# Enter the values for n (number of trials) and p (probability of success):
number.of.trials       <- 100     
probability.of.success <- 0.10     # 
# ==============================================================
# Don't change anything below:
dbinom(0:number.of.trials,size=number.of.trials, prob=probability.of.success)
arguments <- c(0:number.of.trials)
barplot(dbinom(0:number.of.trials,size=number.of.trials, prob=probability.of.success), names.arg = arguments, width= 1, space=0, las=1,ylab="Density", xlab="Number of successes")

# Add  normal overlay:
curve(dnorm(x,number.of.trials*probability.of.success,sqrt(number.of.trials*probability.of.success*(1-probability.of.success))), col="red",lwd="1",add=TRUE) 

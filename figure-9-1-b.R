# Sampling variability of sample proportions (Sharpe et al. (2015), p. 300 (chapter 9))
# Set up the population: a box of 1,000,000 tickets, of which 200,000 "success" and 800,000 "failure"
population <- c(rep("success",200000),rep("failure",800000))       
table(population)

# Compute the proportion of "succcesses" in the population:
table(population)[2]/length(population)

# =================================================================================
# take a random sample of size 1000 from the population (draws without replacement)
x <- sample(population,1000,replace=FALSE)
# display the sample:
x
table(x) 
# Find the sample proportion of successes:
table(x)[2]/length(x)      

#======================
# Empirical Histogram for 10,000 runs (in lecture)
# (cf. the empirical histogram in Sharpe et al. (2015), figure 9.1 p. 300)
#======================
# If we use 10,000 runs,
# the empirical histogram of the percentage in the sample will be close # to the probability histogram.
# Take a sample of 1000 tickets and compute percentage of "successes" in sample.
# Repeat this 10,000 times 
# (Be patient; the computer needs about a minute to do the work.)
sample.size <- 1000
repetitions <- 10000 # Number of samples
observed.values.of.proportion <- c(rep(NA,repetitions)) # initialize observed.values.of.percentage
for (i in 1:repetitions) 
{
  observed.values.of.proportion[i] <- table(sample(population,sample.size,replace=FALSE))[2]/sample.size
}
hist(observed.values.of.proportion,right=FALSE,freq=TRUE,col="lightblue",las=1,xaxp=c(0,1,100),xlab="Sample proportions",ylab="# of samples",main="")
mtext(expression(paste("A histogram of 10,000 samples of size 1000 with a true proportion of 0.20.\n Cf. figure 9.1 p. 300.")))

# As a density histogram:
hist(observed.values.of.proportion,right=FALSE,freq=FALSE,col="lightblue",las=1,xaxp=c(0,1,100),xlab="Sample proportions",main="")
mtext(expression(paste("A histogram of 10,000 samples of size 1000 with a true proportion of 0.20.\n Cf. figure 9.1 p. 300.")))

mean(observed.values.of.proportion) # gives an idea of EV in the probability histogram
sd(observed.values.of.proportion)   # gives an idea of SE in the probability histogram
#======================




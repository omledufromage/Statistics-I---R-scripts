#=====================================================================================
# Interpreting a confidence interval for a proportion
#=====================================================================================
# author: Luc Hens
# date:   3 May 2019
#
# Here is how to replicate a figure like (Sharpe, De Veaux, and Velleman, 2015, fig. 9.6 p. 309).
# The story is based on Freedman, Pisani, and Purves (2007, pp. 385-386)):
#    A hundred survey organisations are hired to estimate the 
#    [proportion] of red marbles in the box. 
#    Unknown to the pollsters, this [proportion] is [0.20]. 
#    Each organisation takes a simple random sample of 2,500 marbles, 
#    and computes a 95%-confidence interval for
#    the [proportion] of reds in the box (...)" 
# Also see: Magnusson, K. (n.d.). Interpreting confidence intervals: An interactive visualization.
# https://rpsychologist.com/d3/CI

# The box contains 100,000 marbles. 20,000 marbles are red (the population proportion
# of reds is 0.20), but this is unknown to the survey organisations.
# Label "Red marble" as a ticket "success" and "Other marble" as a ticket "failure":
box <- c(rep("success",20000),rep("failure",80000))
table(box)  # shows the contingency table

# ************************
no.of.repeats    <-   100    # enter the number of survey organisations (repeats)
sample.size      <-  2500    # enter the sample size
# ************************
index             <- c(1:no.of.repeats)
lower.limit       <- c(rep(NA,no.of.repeats))        # set initial values
upper.limit       <- c(rep(NA,no.of.repeats))        # set initial values
sample.proportion <- c(rep(NA,no.of.repeats))        # set initial values
SE.for.proportion <- c(rep(NA,no.of.repeats))        # set initial values
counter           <- 0                               # set initial value of counter to 0
population.proportion <- table(box)[2]/sum(table(box))
plot(index,index,type="n",las=1,xlab="Proportion",ylab="sample",xlim=c(population.proportion-5*sqrt(population.proportion*(1-population.proportion)/sample.size),population.proportion+5*sqrt(population.proportion*(1-population.proportion)/sample.size)),frame.plot=FALSE)
abline(v=population.proportion,lty="dashed",col="green",lwd=2)

for(i in 1:no.of.repeats) {
  
  sample.i   <- sample(box,sample.size,replace=FALSE)
  sample.sum <- table(sample.i)[2]
  sample.proportion[i] <- sample.sum/sample.size
  SE.for.proportion[i] <- sqrt(  sample.proportion[i]*(1-sample.proportion[i])/sample.size  )
#  SE.for.proportion <- sqrt(  (table(sample.i)[2]/sample.size)*((table(sample.i)[1]/sample.size))  )
  lower.limit[i] <- sample.proportion[i]-2*SE.for.proportion[i]
  upper.limit[i] <- sample.proportion[i]+2*SE.for.proportion[i]
  
  if (population.proportion >= lower.limit[i] & population.proportion <= upper.limit[i])
  { points(sample.proportion[i],i,col="lightblue",pch=20) ; segments(lower.limit[i],i,upper.limit[i],i,col="black"); Sys.sleep(0.5); counter <- counter+1}
  else { points(sample.proportion[i],i,col="lightblue",pch=20) ; segments(lower.limit[i],i,upper.limit[i],i,col="red") ; Sys.sleep(0.5)}
  
}

# Red segments are confidence intervals that do not cover the true population proportion. 

table.of.confidence.intervals <- cbind(lower.limit,sample.proportion,upper.limit)
table.of.confidence.intervals   # displays a table of the confidence intervals
cat("The confidence level is 95 percent. In this simulation,","\n",         counter/no.of.repeats*100, " percent of the confidence intervals","\n","cover the true population proportion.")
# **ENDS HERE*****

# *****************************************************************************
# Central Limit Theorem
# Illustrates Sharpe et al. (2015), section 11.1 (pp. 360-363) 
# Author: Luc Hens, Vrije Universiteit Brussel
# Date:   9 May 2019
# *****************************************************************************

# Set up the population:
# box with 1,2 million tickets: 200,000 tickets "1"; 200,000 tickets "2"; ... ; 200,000 tickets "6"
box <- c(rep(1,20000),rep(2,20000),rep(3,20000),rep(4,20000),rep(5,20000),rep(6,20000))
hist(box,freq=FALSE,breaks=c(0.5,1.5,2.5,3.5,4.5,5.5,6.5),yaxs="i",las=1,main="",xlab="X",col="lightblue3")

# Draw 2 tickets without replacement and find the mean:
draw.1 <- sample(box,1, replace=FALSE) ; draw.1
draw.2 <- sample(box,1, replace=FALSE) ; draw.2
(draw.1+draw.2)/2

# *****************************************************************************
# Draw 2 tickets (n=2) without replacement and find the mean;
# Repeat this 10,000 times and make a density histogram:

no.of.repeats <- 10000   # enter the number of survey organisations (repeats)
sample.size   <- 2       # enter the sample size   
index            <- c(1:no.of.repeats)
sample.mean      <- c(rep(NA,no.of.repeats))        # set initial values

for(i in 1:no.of.repeats) {
  
  sample.mean[i] <- sum(sample(box,sample.size,replace=FALSE))/sample.size

}

hist(sample.mean,breaks=12,freq=FALSE,las=1,xlim=c(1,6),yaxs="i",main="",xlab="sample average (n=2)",col="chocolate2")


# *****************************************************************************
# Draw 5 tickets without replacement and find the mean;
# Repeat this 10,000 times and make a density histogram:
no.of.repeats    <-  10000   
sample.size      <-  5    
index            <- c(1:no.of.repeats)
sample.mean      <- c(rep(NA,no.of.repeats))        # set initial values

for(i in 1:no.of.repeats) {
  
  sample.mean[i] <- sum(sample(box,sample.size,replace=FALSE))/sample.size
  
}

hist(sample.mean,breaks=24,freq=FALSE,xlim=c(1,6),yaxs="i",las=1,main="",xlab="sample average (n=5)",col="cadetblue4")

# *****************************************************************************
# Draw 20 tickets without replacement and find the mean;
# Repeat this 10,000 times and make a density histogram:
no.of.repeats    <-  10000   
sample.size      <-  20    
index            <- c(1:no.of.repeats)
sample.mean      <- c(rep(NA,no.of.repeats))        # set initial values

for(i in 1:no.of.repeats) {
  
  sample.mean[i] <- sum(sample(box,sample.size,replace=FALSE))/sample.size
  
}

hist(sample.mean,breaks=24,freq=FALSE,xlim=c(1,6),yaxs="i",las=1,main="",xlab="sample average (n=20)",col="darkgreen")

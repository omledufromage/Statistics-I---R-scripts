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
# Find the sample of successes:
table(x)[2]/length(x)         
 # =================================================================================
# repeat the last block of code (encloded in ======) a couple of times


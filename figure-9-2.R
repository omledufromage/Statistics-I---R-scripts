# Distribution of sample proportions
# figure 9.2 in Sharpe et al. (2015, p. 301)
n <- 1000
p <- 0.20
curve(dnorm(x,mean=p, sd=sqrt(p*(1-p)/n)),las=1,xlim=c(p-4*sqrt(p*(1-p)/n),p+4*sqrt(p*(1-p)/n)),ylab="density",xlab="Sample proportions",xaxs="i",yaxs="i",frame.plot=FALSE) 

# shade area under pdf:
x.lower.boundary    <-   p-4*sqrt(p*(1-p)/n)   
x.upper.boundary    <-   p+4*sqrt(p*(1-p)/n)   
cord.x <- c(x.lower.boundary,       seq(x.lower.boundary,x.upper.boundary,0.001)                                , x.upper.boundary) 
cord.y <- c(               0, dnorm(seq(x.lower.boundary,x.upper.boundary,0.001), mean=p, sd=sqrt(p*(1-p)/n) )  , 0               )
polygon(cord.x,cord.y,col="lightblue",lty="blank") 
## Test 1
## scale does affect the loading, but doesn't affect projection(scores)
x <- mvrnorm(100,rep(0,10),X.sig <- exp(-1*abs(outer(1:10,1:10,"-"))))
y <- x %*% cbind(c(rep(1,5),rep(0,5)),c(rep(0,5),rep(2,5))) + mvrnorm(100,rep(0,2),diag(2))

cc1 <- cc(x,y)
cc2 <- cc(scale(x,center = T,scale = FALSE),scale(y,center = T,scale = FALSE))
cc3 <- cc(scale(x,center=T,scale=T),scale(y,center=T,scale=T))


head(cc1$scores$xscores)
head(cc2$scores$xscores)
head(cc3$scores$xscores)

## Test 2
## when "the leading minor of order 18 is not positive definite" happens
## resampled sample in the CCA analysis
indices <- sample(1:5,20,replace=T)
x <- mvrnorm(5,rep(0,10),X.sig <- exp(-1*abs(outer(1:10,1:10,"-"))))
y <- x %*% cbind(c(rep(1,1),rep(0,9)),c(rep(0,9),rep(2,1)))
cc1 <- cc(x[indices,],y[indices,])

library(sampling)
set.seed(10)
s = srswor(20,100)
(1:100)[s!=0]
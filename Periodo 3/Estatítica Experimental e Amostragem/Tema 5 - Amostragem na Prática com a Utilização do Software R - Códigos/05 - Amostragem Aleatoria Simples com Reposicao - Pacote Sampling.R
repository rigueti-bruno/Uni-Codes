library(sampling)
set.seed(9)
s = srswr(20,100)
s
(1:100)[s!=0]
(1:100)[s==2]

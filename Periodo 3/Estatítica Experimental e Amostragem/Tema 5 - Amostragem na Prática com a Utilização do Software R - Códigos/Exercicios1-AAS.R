N = 45965
n = 5

set.seed(7)
Sample = sample(1:N,n)
Sample

library(sampling)
set.seed(7)
Sampling = srswor(n,N)
(1:N)[Sampling!=0]
data("belgianmunicipalities")
fix("belgianmunicipalities")

n = 200
N = nrow(belgianmunicipalities)
set.seed(2)

select = sample(1:N,n)
amostra = belgianmunicipalities[select,]

library(survey)
amostra$N = N
AAS = svydesign(id=~0,data=amostra,fpc=~N)
svymean(~averageincome,AAS)
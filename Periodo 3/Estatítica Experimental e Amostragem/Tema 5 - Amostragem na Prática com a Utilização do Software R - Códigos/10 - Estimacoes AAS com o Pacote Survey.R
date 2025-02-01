library(sampling) # carrega a biblioteca onde o dataset está
data("MU284") # carrega o dataset
N = nrow(MU284)
n = 80
set.seed(8)
selec = sample(1:N,n)
amostra = MU284[selec,]

library(survey)
amostra$N = N
AAS = svydesign(id = ~0,data=amostra,fpc=~N)
AAS

# Estimações da Media Populacional:
ESTmed = svymean(~P85,AAS)

# Etimações do Total Populacional:
ESTtot = svytotal(~P85,AAS)

ESTmed

ESTtot
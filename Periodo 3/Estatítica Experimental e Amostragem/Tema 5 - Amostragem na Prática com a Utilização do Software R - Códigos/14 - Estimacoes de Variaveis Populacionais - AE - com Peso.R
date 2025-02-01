rm(list = ls())  # Remove todas as variáveis do ambiente
gc()  # Libera memória

library(sampling)
data(MU284)
table(MU284$REG) # obtem uma tabela com os possiveis estratos
prop.table(table(MU284$REG)) # obtem o peso de cada estrato

np = 80 # tamanho da amostra planejado
np * prop.table(table(MU284$REG)) # alocação proporcional da amostra

# Selecionando a Amostra Estratificada:
set.seed(3)
selec = strata(MU284,stratanames = "REG",size=c(8,14,10,11,16,12,5,9),method = "srswor")

# Obtendo a Amostra da base de dados MU284:
amostra = getdata(MU284,selec)

# Indicar o Vetor de Pesos:
amostra$PESO = 1/amostra$Prob

# Criando o vetor fpc com os totais populacionais dos estratos:
fpc = rep(c(25,48,32,38,56,41,15,29),c(8,14,10,11,16,12,5,9))

# Especificação do Plano Amostral:
library(survey)
plano_est = svydesign(id=~1,strata=~Stratum,probs=~selec$Prob,data=amostra,fpc=~fpc)
plano_est2 = svydesign(id=~1,strata=~Stratum,wieghts=~PESO,data=amostra,fpc=~fpc)

media1 = svymean(~P85,plano_est)
total1 = svytotal(~P85,plano_est)

media2 = svymean(~P85,plano_est2)
total2 = svytotal(~P85,plano_est2)

media1 == media2
total1 == total2

media1
media2

total1
total2
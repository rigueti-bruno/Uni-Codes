library(sampling)
data(MU284)
table(MU284$REG) # obtem uma tabela com os possiveis estratos
prop.table(table(MU284$REG)) # obtem o peso de cada estrato

np = 80 # tamanho da amostra planejado
np * prop.table(table(MU284$REG)) # alocação proporcional da amostra

# Selecionando a Amostra Estratificada:
set.seed(3)
selec = strata(MU284,stratanames = "REG",size=c(8,14,10,11,16,12,5,9),method = "srswor")

head(selec,10) # visualiza as 10 primeiras unidades da seleção da amostra

selec$Prob # visualiza as probabilidades de seleção das amostras

# Obtendo a Amostra da base de dados MU284:
amostra = getdata(MU284,selec)

head(amostra,8) # visualiza as 8 primeiras amostras obtidas

# Criando o vetor fpc com os totais populacionais dos estratos:
fpc = rep(c(25,48,32,38,56,41,15,29),c(8,14,10,11,16,12,5,9))

# Especificação do Plano Amostral:
library(survey)
plano_est = svydesign(id=~1,strata=~Stratum,probs=~selec$Prob,data=amostra,fpc=~fpc)
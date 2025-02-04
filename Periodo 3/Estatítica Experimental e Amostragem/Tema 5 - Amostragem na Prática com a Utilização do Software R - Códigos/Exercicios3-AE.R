library(sampling)
data(MU284)
table(MU284$REG) # obtem uma tabela com os possiveis estratos
prop.table(table(MU284$REG)) # obtem o peso de cada estrato

np = 50 # tamanho da amostra planejado
np * prop.table(table(MU284$REG)) # alocação proporcional da amostra

# Selecionando a Amostra Estratificada:
set.seed(3)
selec = strata(MU284,stratanames = "REG",size=c(5,9,6,7,10,8,3,6),method = "srswor")

# Obtendo a Amostra da base de dados MU284:
amostra = getdata(MU284,selec)

# Criando o vetor fpc com os totais populacionais dos estratos:
fpc = rep(c(25,48,32,38,56,41,15,29),c(5,9,6,7,10,8,3,6))

# Especificação do Plano Amostral:
library(survey)
plano_est = svydesign(id=~1,strata=~Stratum,probs=~selec$Prob,data=amostra,fpc=~fpc)

# Estimação da Media Populacional e de seu Erro Padrão no Plano Estratificado:
svymean(~RMT85,plano_est)
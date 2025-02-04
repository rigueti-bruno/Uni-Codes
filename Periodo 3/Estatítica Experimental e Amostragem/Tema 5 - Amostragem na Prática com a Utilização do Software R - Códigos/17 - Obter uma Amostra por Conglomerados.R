library(sampling)
data(MU284)
dados = MU284

# Identificar os Clusters:
table(MU284$CL)

# Construir a Amostra por Conglomerados:
set.seed(5)
ACS=cluster(MU284,clustername = c("CL"),size = 14,method = c('srswor'))

# Visualizar algumas amostras selecionadas:
head(ACS,10)

# Extrair a Amostra do Dataset Original:
ACSs = getdata(MU284,ACS)

# Visualizar as informações das amostras selecionadas:
fix(ACSs)

# Construir o Fator fpc:
fpc2 = rep(50,dim(ACSs)[1])
fpc2

# Especificação do Plano Amostral:
library(survey)
PlanoC = svydesign(id=~CL,data=ACSs,probs=~ACS$Prob,fpc=~fpc2)

# Verificação do Plano Amostral Definido:
PlanoC # nome da variavel que recebeu o plano amostral
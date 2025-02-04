library(sampling)
data(MU284)
dados = MU284

# Identificar os Clusters:
table(MU284$CL)

# Construir a Amostra por Conglomerados:
set.seed(5)
ACS=cluster(MU284,clustername = c("CL"),size = 14,method = c('srswor'))

# Extrair a Amostra do Dataset Original:
ACSs = getdata(MU284,ACS)

# Construir o Fator fpc:
fpc2 = rep(50,dim(ACSs)[1])

# Especificação do Plano Amostral:
library(survey)
PlanoC = svydesign(id=~CL,data=ACSs,probs=~ACS$Prob,fpc=~fpc2)

# Estimação do Total e seu Erro Padrão:
svytotal(~P85,PlanoC)
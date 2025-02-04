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

# Construir o Vetor peso:
peso = 1/ACS$Prob

# Especificação do Plano Amostral:
library(survey)
PlanoC2 = svydesign(id=~CL,data=ACSs,weights = peso,fpc=~fpc2)

# Estimação da Média e seu Erro Padrão:
svymean(~P85,PlanoC2)

# Estimação do Total e seu Erro Padrão:
svytotal(~P85,PlanoC2)
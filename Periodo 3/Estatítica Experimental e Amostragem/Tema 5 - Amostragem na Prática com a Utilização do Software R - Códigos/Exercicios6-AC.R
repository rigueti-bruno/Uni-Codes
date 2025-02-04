library(sampling)
data(belgianmunicipalities)
dados = belgianmunicipalities

fix(belgianmunicipalities)

# Identificando os Clusters
table(belgianmunicipalities$Province)

# Construir a Amostra por Conglomerados:
set.seed(10)
ACS=cluster(belgianmunicipalities,clustername = c("Province"),size = 3,method = c('srswor'))

# Extrair a Amostra do Dataset Original:
ACSs = getdata(belgianmunicipalities,ACS)

# Construir o Fator fpc:
fpc2 = rep(9,dim(ACSs)[1])

# Especificação do Plano Amostral:
library(survey)
PlanoC = svydesign(id=~Province,data=ACSs,probs=~ACS$Prob,fpc=~fpc2)

# Estimação da Média e seu Erro Padrão:
svymean(~averageincome,PlanoC)
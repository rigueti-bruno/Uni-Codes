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

# Construir o Vetor peso:
peso = 1/ACS$Prob

# Especificação do Plano Amostral:
library(survey)
planoC_sem_fpc = svydesign(id=~CL,data=ACSs,weights = peso)

# Estimação da Média e seu Erro Padrão:
svymean(~P85,planoC_sem_fpc)

# Estimação do Total e seu Erro Padrão:
svytotal(~P85,planoC_sem_fpc)
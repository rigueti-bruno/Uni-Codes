library(sampling)
data(belgianmunicipalities)
fix(belgianmunicipalities)
table(belgianmunicipalities$Province) # obtem uma tabela com os possiveis estratos

prop.table(table(belgianmunicipalities$Province)) # obtem o peso de cada estrato

np = 300 # tamanho da amostra planejado
np * prop.table(table(belgianmunicipalities$Province)) # alocação proporcional da amostra

# Selecionando a Amostra Estratificada:
set.seed(5)
selec = strata(belgianmunicipalities,stratanames = "Province",size=c(36,57,33,34,36,43,23,23,20),method = "srswor")

# Obtendo a Amostra da base de dados belgianmunicipalities:
amostra = getdata(belgianmunicipalities,selec)

# Criando o vetor fpc com os totais populacionais dos estratos:
fpc = rep(c(70,111,64,65,69,84,44,44,38),c(36,57,33,34,36,43,23,23,20))

# Especificação do Plano Amostral:
library(survey)
plano_est = svydesign(id=~1,strata=~Stratum,probs=~selec$Prob,data=amostra,fpc=~fpc)
plano_est2 = svydesign(id=~1,strata=~Stratum,probs=~selec$Prob,data=amostra)

# Estimação da Media Populacional e de seu Erro Padrão no Plano Estratificado:
svyby(~averageincome,by=~Stratum,design=plano_est,FUN = svymean) # com fpc

svyby(~averageincome,by=~Stratum,design=plano_est2,FUN = svymean) # sem fpc
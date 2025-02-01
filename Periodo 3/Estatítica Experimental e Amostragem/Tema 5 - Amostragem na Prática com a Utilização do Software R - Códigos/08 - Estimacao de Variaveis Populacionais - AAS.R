library(sampling) # carrega a biblioteca onde o dataset está
data("MU284") # carrega o dataset
N = nrow(MU284)
n = 80
set.seed(8)
selec = sample(1:N,n)
amostra = MU284[selec,]

# Estimação da média populacional:
MEaas = sum(amostra$P85)/n
MEaas

# Estimação da variancia da média populacional estimada:
Vme = (1-n/N)*var(amostra$P85)/n
Vme

# Erro padrão da estimativa da média populacional:
Eme = sqrt((1-n/N)*var(amostra$P85)/n)
Eme

Linfme = MEaas - Eme
Linfme
Lsupme = MEaas + Eme
Lsupme
Amplitude = Lsupme - Linfme
Amplitude
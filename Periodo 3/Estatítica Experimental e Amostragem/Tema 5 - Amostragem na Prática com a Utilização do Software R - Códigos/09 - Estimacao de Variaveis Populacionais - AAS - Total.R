library(sampling) # carrega a biblioteca onde o dataset está
data("MU284") # carrega o dataset
N = nrow(MU284)
n = 80
set.seed(8)
selec = sample(1:N,n)
amostra = MU284[selec,]

# Estimação do Total Populacional:
Tot = N*sum(amostra$P85)/n
Tot

# Estimação da variância do total populacional estimado:
Vtot = N^2*(1/n-1/N)*var(amostra$P85)
Vtot

# Erro padrão da estimação do total populacional:
Etot = sqrt(N^2*(1/n-1/N)*var(amostra$P85))
Etot

Linftot = (Tot - Etot) * 1000
Lsuptot = (Tot + Etot) * 1000
Amplitude = Lsuptot - Linftot
Amplitude
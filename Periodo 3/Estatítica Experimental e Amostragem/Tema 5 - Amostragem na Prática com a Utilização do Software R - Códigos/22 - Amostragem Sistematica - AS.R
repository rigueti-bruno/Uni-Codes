# Obtendo o K:
set.seed(10)
k <- round((1/20)*100)

# Obtendo o ponto de partida r:
r <- sample(seq(1,k,1),1)

# Obtendo a Amostra:
amostra = c(r,r+k,r+2*k,r+3*k,r+4*k,r+5*k)
amostra
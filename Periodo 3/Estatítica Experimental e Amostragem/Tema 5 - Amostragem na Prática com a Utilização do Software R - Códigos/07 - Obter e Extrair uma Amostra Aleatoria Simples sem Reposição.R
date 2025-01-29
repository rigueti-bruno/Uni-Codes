data(MU284)
#fix(MU284) - exibe o dataset inteiro
N = nrow(MU284) # calcula o tamanho da população
n = 80 # define o tamanho da amostra
set.seed(8)
selec = sample(1:N,n) # calcula as unidades da amostra
amostra = MU284[selec,] #extrai a amostra do dataset
amostra # exibe a amostra
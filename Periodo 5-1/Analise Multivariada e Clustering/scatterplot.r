library(MASS)
data(Boston)

# Criando um grafico de dispersao multivariado:
pairs(Boston[,c("rm","medv","lstat","age")])

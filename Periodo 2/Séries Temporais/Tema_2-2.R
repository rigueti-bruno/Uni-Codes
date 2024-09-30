library(forecast)

dados <- read.table("clipboard")

serie <- ts(dados, start=c(2005,1), end=c(2019,12), frequency=12)

treino <- window(serie, end=c(2018,12))

validacao <- window(serie,start=c(2019,1))

# definimos os períodos de treino e validação

fit <- ses(treino, h=12)
# aplica o método para obter previsões para até 12 passos à frente (horizonte)

summary(fit)

plot(fit,main = "Previsões x Valores Observados nos Últimos 12 meses")
# plota as previsões com intervalos de confiança de 80% a 95%

lines(validacao,lty=3)
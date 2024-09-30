# Carregando a Biblioteca Forecast:

library(forecast)

# Carregando os dados:

dados <- read.table("clipboard")

serie <- ts(dados,start=c(2000,1),end=c(2019,12),frequency=12)

# Definindo os periodos de treino e validação:

treino <- window(serie,end=c(2018,12))

validacao <- window(serie,start=c(2019,1))

# Aplicando o Metodo de Holt para obter previsões para até 7 passos à frente:

fit <- hw(treino,h=12)

# Exibir as Constantes de Amortecimento Estimadas e as Previsões:

summary(fit)

# Plota as previsões com intervalos de confiança de 80% e 95%:

plot(fit,main="Previsões x Valores Observados nos Últimos 7 meses")
lines(validacao,lty=3)
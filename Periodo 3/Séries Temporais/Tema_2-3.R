# Carregando a Biblioteca Forecast:

library(forecast)

# Carregando os dados:

dados <- read.table("clipboard")

serie <- ts(dados,start=c(1999,12),end=c(2020,7),frequency=12)

# Definindo os periodos de treino e validação:

treino <- window(serie,end=c(2019,12))

validacao <- window(serie,start=c(2020,1))

# Aplicando o Metodo de Holt para obter previsões para até 7 passos à frente:

fit <- holt(treino,h=7)

# Exibir as Constantes de Amortecimento Estimadas e as Previsões:

summary(fit)

# Plota as previsões com intervalos de confiança de 80% e 95%:

plot(fit,main="Previsões x Valores Observados nos Últimos 7 meses")
lines(validacao,lty=3)
dados <- read.table("clipboard")

serie <- dados[,1]

mes <- dados[,2]

model <- lm(formula = serie ~ mes)
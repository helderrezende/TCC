library('fGarch')
library(zoo)

retornos <- read.zoo("retornos.csv",header = TRUE, sep = ",")
n = dim(retornos)[1]
d = dim(retornos)[2]
resultado = list()
parametros = matrix(0,d,8)
volatilidade = matrix(0,d,n)
residuos = matrix(0,d,n)

for (i in 1:d){

resultado[[i]] = garchFit(cond.dist = "std", data = retornos[,i])
parametros[i,] = resultado[[i]]@fit$params$params
volatilidade[i,] = resultado[[i]]@sigma.t 
residuos[i,] = resultado[[i]]@residuals

}

write.csv(parametros, file = "parametros.csv")
write.csv(volatilidade, file = "volatilidade.csv")
write.csv(residuos, file = "residuos.csv")






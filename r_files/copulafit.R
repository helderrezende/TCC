

library(copula)
library(zoo)

uniform <- read.zoo("uniforms.csv",header = TRUE, sep = ",")
uniform = as.matrix(uniform)
set.seed(500)
tcop <- tCopula(dim = 4,dispstr = "un")
fit.t <- fitCopula(tcop, uniform, method="ml")
write.csv(coef(fit.t), file = "ParametrosOtimo.csv")
u <- rCopula(200,tCopula(dim=4,dispstr = "un",coef(fit.t)[1:6],df=coef(fit.t)[7]))
write.csv(u, file = "CopulaOtimaSimulada.csv")
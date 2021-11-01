y<-c(133.8,125.3,143.1 ,128.9, 135.7 ,
     152.2 ,149.0 ,162.7 ,145.8 ,153.5 ,
      225.8 ,224.6, 220.4 ,212.3 ,
      193.4 ,185.3, 182.8 ,188.5 ,198.6 )
# el diseño no es balanceado
a<-c(rep(1,5),
     rep(2,5),
     rep(3,4),
     rep(4,5))
a<-factor(a)

# Tabla anova
Anova3<-aov(y~a)
summary(Anova3)
# rechazo H0
# seE = 41
# 


## Comparaciones múltiples

# Test LSD

library(agricolae)
hsd <- HSD.test(y,a,15,41,unbalanced = TRUE)
hsd
# Rechazo porque hay 4 grupos distintos, las 4 dietas son diferentes.


## Diagnosis 
## 


### Normalidad

#### Gráfico
layout(matrix(c(1,2,3,4),ncol=2))
plot(Anova3)
# gráficamente observando el QQ plot parece que voy a aceptar la normalidad
# los puntos están alrededor de una linea recta, con más enfasis en el centro
# existen oscilaciones en los extremos


qqnorm(Anova3$residuals) # grafico qq de normalidad
qqline(Anova3$residuals) # grafico qq de normalidad + linea pasando por Q1 y Q3

#### Test de CvM  para contrastar normalidad

#### H0: epsilon sigue una N(0,sigma^2), con sigma^2 > 0
#### 
library(nortest)
cvm.test(Anova3$residuals)
# No existen evidencias para decir que los errores no se distribuyen segun una normal


### Independencia

# No tiene sentido aquí





### Homocedasteceidad

#### Método gráfico
# residuos vs valores ajustados
plot(Anova3$fitted.values, Anova3$residuals, xlab="medias", ylab="residuos")
abline(h=0) #añade a grafico al linea h=0

# datos en torno a una banda, no se observa que la oscilación cambie con el
# valor de los fitted values, parece por el gráfico que no voy a rechazar
# la homocedasteceidad
# el gráfico me ayuda a saber el porque rechazo

#  residuos vs grupos
a<-as.numeric(a)
plot(a, Anova3$residuals, xlab="grupos", ylab="residuos")
abline(h=0) #añade al grafico al linea h=0



#### Test
#Test de Levene: hay que cargar el paquete lawstat
library(lawstat)
levene.test(y,a,location = "mean") # deviations from the median
# No existen evidencias en contra de la hipótesis
# homocedastecerdad, por tanto, las varianzas son iguales

# si hay outliers el p-valor habría cambiado considerablemente al poner mean

#Test de Bartlett
bartlett.test(y,a)
# Misma conclusión con este test



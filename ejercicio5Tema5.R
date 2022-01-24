# Dbib

# aditivos. Factor con cinco niveles TRATAMIENTOS
# tipo de vehículo. Factor con cinco niveles. BLOQUES

y=c( 17 ,14, 13, 12, 14 ,14, 13, 10, 12 ,13, 12, 9, 13 ,11, 11, 12, 11 ,12, 10,8 )
aditivo <- as.factor(rep(1:5, each=4))
vehiculo<- as.factor(c(2,3,4,5,1,2,4,5,1,3,4,5,1,2,3,4,1,2,3,5) ) 
library(agricolae)

BIB.test(vehiculo,aditivo,y,test="tukey",console=TRUE)

## Parámetros
## Lambda     : 3
## treatmeans : 5
## Block size : 4
## Blocks     : 5
## Replication: 4 


## contraste de igualdad de efectos de los tratamientos, igualdad de efectos de 
## los aditivos
## trt.adj      4 35.733  8.9333  9.8103 0.001247 **
## p-valor: 0.001247 **
## Conclusión: no existen diferencias significativas para aceptar la igualdad de 
## efectos de los tratamientos, los aditivos no tienen el mismo efecto en 
## los distintos tipos de vehículo

## Comparaciones múltiples:
##          y groups
## 1 14.25000      a
## 2 12.78333     ab
## 3 11.85000     bc
## 4 11.11667     bc
## 5 10.25000      c

# Hemos rechazado porque existen 3 grupos de aditivos que no podemos considerar
#  significativamente distintos: 
#  1,2
#  3,4,5
#  2,3,4


## ¿Tiene sentido un diseño por bloques?
## contraste de igualdad de efectos de los bloques:
BIB.test(aditivo,vehiculo,y,test="tukey",console=TRUE)
##   4 35.233  8.8083   9.673 0.001321 **
## p-valor: 0.001321 ** rechazo
## Conclusión: No existen evidencias significativas para aceptar 
## la igualdad de efectos del típo de vehículo, por lo que sí tiene sentido un dbib
## El tipo de vehículo incide en el efecto de la gasolina.

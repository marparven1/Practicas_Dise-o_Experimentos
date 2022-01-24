# Diseño en cuadro latino
# Factores
#   Operadores . 4 niveles
#   Orden de ensamblaje. 4 niveles
#   letras latinas= tiempo de ensamblaje de una componente de televisores

## Analizar modelo

tiempo=c(10,14,7,8,7,18,11,8,5,10,11,9,10,10,12,14) # respuesta Y
orden = as.factor(rep(1:4,each=4))
operador= as.factor(rep(1:4,4))
letra=as.factor(c(3,2,4,1,2,3,1,4,1,4,2,3,4,1,3,2))

summary(aov(tiempo~orden+operador+letra))
## Contrastes

### Igualdad de efecto del orden de ensamblaje = igualdad efecto filas
# p-valor = 0.479 # acepto
# conclusión: no existen diferencias significativa en el orden de ensamblaje (respuesta)

## Igualdad de efecto de los operadores = no efecto de las columnas
# p-valor = 0.147 # acepto
# conclusión: los operadores no influyen en el tiempo de ensamblaje (respuesta)

## Igualdad de efectos del método de ensamblaje = Igualdad de efectos de las letras latinas
# p-valor = 0.189 # acepto la igualdad de efctos
# conclusión: el método de ensamblaje no influyen en el tiempo de ensamblaje (respuesta)

## como he aceptado, puedo quitar las filas y se me queda de nuevo un cuadro latino?
## porque al aceptar, para estudios posteriore spuedo no considerar los ordenes de ensamblaje


## Añado letras griegas

## lo hago primero como cuadrado grecolatino y luego como CREO que se podría


tiempo=c(10,14,7,8,7,18,11,8,5,10,11,9,10,10,12,14) # respuesta Y
orden = as.factor(rep(1:4,each=4))
operador= as.factor(rep(1:4,4))
letrasLatinas=as.factor(c(3,2,4,1,2,3,1,4,1,4,2,3,4,1,3,2))
letrasGriegas=as.factor(c(2,4,3,1,1,3,4,2,3,1,2,4,4,2,1,3)) # posición
summary(aov(tiempo~orden+operador+letrasLatinas+letrasGriegas))


## Contrastes

### Igualdad de efecto del orden de ensamblaje = igualdad efecto filas
# p-valor = 0.650 # acepto
# conclusión: no existen diferencias significativa en el orden de ensamblaje (respuesta)

## No efecto de los operadores = no efecto de las columnas
# p-valor =  0.334 # acepto
# conclusión: no los operadores no influyen en el tiempo de ensamblaje, todos trabajan igual (respuesta)

## Igualdad de efectos del método de ensamblaje = Igualdad de efectos de las letras latinas
# p-valor = 0.384 # acepto la igualdad de efctos
# conclusión: el método de ensamblaje no influyen en el tiempo de ensamblaje (respuesta)

## Igualdad de efectos de la posición = Igualdad de efectos de las letras griegas
# p-valor = 0.815 # acepto la igualdad de efctos
# conclusión: la posición del trabajador no influye en el tiempo de ensamblaje (respuesta)


## Vamos a hacerlo ahora considerando que en el primer análisis del cuadrado latino, habíamos concluido que 
## el orden de ensamblaje no influía en el tiempo (repsuesta), por lo que consideramos un cuadrado latino sin
## estas letras latinas y ahora sólo griegas.


tiempo=c(10,14,7,8,7,18,11,8,5,10,11,9,10,10,12,14) # respuesta Y
orden = as.factor(rep(1:4,each=4))
operador= as.factor(rep(1:4,4))
# letrasLatinas=as.factor(c(3,2,4,1,2,3,1,4,1,4,2,3,4,1,3,2))
letrasGriegas=as.factor(c(2,4,3,1,1,3,4,2,3,1,2,4,4,2,1,3)) # posición
summary(aov(tiempo~orden+operador+letrasGriegas))

# letrasGriegas  3    9.5   3.167   0.259  0.853

## Igualdad de efectos de la posición = Igualdad de efectos de las letras griegas
# p-valor = 0.853 # acepto la igualdad de efctos
# conclusión: la posición del trabajador no influye en el tiempo de ensamblaje (respuesta)


# antes teníamos:
# letrasGriegas  3    9.5   3.167   0.317  0.815
# La conclusión es la misma, al igual que la GL, SC y MeanSC de las letras griegas.
# El F estadístico y el p-valor varían ligeramente, pero es la misma conclusión.






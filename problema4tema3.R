#EJERCICIO 4


## Se está estudiando el rendimiento de un proceso químico.
## Se cree que las dos variables más importantes son la presión
## y la temperatura. Se seleccionan tres niveles de cada factor y 
## se realiza un experimento factorial con dos réplicas, obteniéndose
## los siguientes resultados

y=c(90.4,90.2,90.7,90.6,90.2,90.4,90.1,90.3,90.5,90.6,89.9,90.1,90.5,90.7,90.8,90.9,90.4,90.1)

presion=rep(c(1,1,
                  2,2,
                  3,3),
                3)
temperatura=c(rep(1,6),rep(2,6),rep(3,6))
A=as.factor(temperatura)
B=as.factor(presion)

problema4=aov(y~A*B)
summary(problema4)


# Interpretación
## Para el factor A rechazo la igualdad de efectos. Al menos dos niveles son distintos
## Para el factor B rechazo la igualdad de efectos. idem
## La iteracción: No existen evidencias significativas para rechazar la igualdad de efectos.
## Los niveles de temperatura no varían respecto a la presión.

## compe

## Analiza los resultados suponiendo que
## (a) Ambos factores son fijos.
## (b) Uno de ellos es fijo y el otro es aleatorio.
## (c) Ambos factores son aleatorios.

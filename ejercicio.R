#Paso 1. Escribir el modelo e hipótesis distribucionales. Me voy a aptes

#Analice los resultados suponiendo que: 
  
#(a) Todos los factores son fijos: 
  

library(EMSaov)
y=c(34.1, 34.7, 35.2, 32.1, 33.1, 32.8, 32.9, 34.8, 33.6,
    32.3, 35.9, 35.8, 33.5, 34.7, 35.1, 33.0, 34.4, 32.8,
    32.6, 36.0, 34.1, 34.0, 33.9, 34.3, 33.1, 33.8, 31.7,
    24.3, 25.1, 25.7, 24.1, 24.1, 26.0, 24.2, 25.2, 24.7,
    26.3, 26.3, 26.1, 25.0, 25.1, 27.1, 26.1, 27.4, 22.0,
    27.1, 25.6, 24.9, 26.3, 27.9, 25.9, 25.3, 26.0, 24.8)
operario=as.factor(rep(1:3, 18))
maquina=as.factor(rep(rep(1:3, each=3),6))
potencia=as.factor(rep(1:2, each=27))
# tengo que construir data.frame para la tabla
ejemplo2=data.frame(resp=y,maq=maquina,pot=potencia, oper=operario)

sal=EMSanova(resp~maq+oper+pot # resp y los factores detrás
             # mas no es que sea aditivo, es que hago el modelo completo
             , data=ejemplo2,
             type=c("F","F","F"), # type si fijo o anidado
             nested=c(NA,"maq",NA))
sal



#Debo hacer comparaciones múltiples para las máquinas y los operarios.

# - Máquinas


library(agricolae)
snk=SNK.test(ejemplo2$resp, # variable respuesta
             ejemplo2$maq, # vble que define los grupos
             DFerror =  36, # gr libertad  
             MSerror = 1.0766667	) # CM_denominador (Deno es el error) 
# ha tomado CM_e como estimador de la var(el denominador del F-estadístico)
snk$groups


#- Operarios


library(agricolae)
snk=SNK.test(ejemplo2$resp, # variable respuesta
             ejemplo2$oper, # vble que define los grupos
             DFerror =  36, # gr libertad  
             MSerror = 1.0766667	) # CM_denominador (Deno es el error) 
# ha tomado CM_e como estimador de la var(el denominador del F-estadístico)
snk$groups


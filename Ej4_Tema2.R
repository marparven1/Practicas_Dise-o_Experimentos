# marta este es el dos pringada 
y<-c(58.2 , 57.2  , 58.4 , 55.8 , 54.9,
     56.3 , 54.5  , 57.0 , 55.3,
     50.1,  54.2 ,  55.4 ,
     52.9,  49.9 ,  50.0 , 51.7  )
# el diseño no es balanceado
a<-c(rep(1,5),
     rep(2,4),
     rep(3,3),
     rep(4,4))
a<-factor(a)




# Tabla anova
Anova4<-aov(y~a)
summary(Anova4)
# rechazo H0
# 
# 
# 
# hacer el 4!!!! rechazo y como es valanceado hago comp multiples
# test newman-keuls para desacer el empate (no siempre)
# por tanto, hemso rechazado porque hay 3 grupos
# hacer diagnosis



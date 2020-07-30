mochila <- data.frame(item = c("canivete", "feijao", "batatas", "lanterna",
                               "saco de dormir", "corda", "bussola"), pontos = c(10,
                                20, 15, 2, 30, 10, 30), peso = c(1,5,10,1,7,5,1))

library(GA)

f <- function(x){
  
  pontos = 0
  peso = 0
  
  for(i in 1:7){
    if(x[i] != 0){ # Se o item for 1(binario) insere na mochila e � somado
      pontos = pontos + mochila[i,2] # Este '2' � referente � coluna pontos
      peso = peso + mochila[i,3] # Este '3' � referente � coluna peso
    }
  }
  
  if(peso > 15){ # a mochila n�o pode pesar mais de 15KG, caso contr�rio, zera
    pontos = 0
  }
  
  return(pontos)
}

resultado = ga("binary", fitness = f, nBits = 7, popSize = 10, maxiter = 15, 
               names = c("canivete", "feijao", "batatas", "lanterna", "saco de dormir", 
                         "corda", "bussola"))

summary(resultado)
summary(resultado)$solution
plot(resultado)

#binary = tipo bin�rio
#nbits = n�mero de bits (7 bits/elementos)

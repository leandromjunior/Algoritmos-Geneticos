#install.packages("GA")

library(GA)

f<-function(x) # Essa função recebe do algoritmo genético(ga) o resultado da equação
                #e armazena o valor na variavel resultado (x é a entrada da função)
{
  
  #equacao 2 * x + 5 = 20
  resultado = 2 * x + 5 

  if(resultado >= 20){
    return(20 - resultado) # Com este return, é possível dar uma 'pista' para o
                           #algoritmo genético saber se está se aprox. ou nao da solução
  }
  else{
    return(resultado - 20)
  }
}

resultado = ga("real-value", fitness = f, lower=c(-20), upper=c(20), popSize = 10,
               maxiter = 20, monitor = T, names=c("a"))

summary(resultado)$solution

plot(resultado) #Mostrar o resultado graficamente

#real-value é o tipo do valor
#fitness recebe a função ajuste
#lower(min) é o valor mínimo que o algoritmo deve retornar durante as tentativas de achar a solução
#upper(max) é o valor máximo que o algoritmo deve retornar durante as tentativas de achar a solução
#popSize é o tamanho da população, ou seja, número de cromossomos
# maxiter é a quantidade de vezes que o algoritmo tentará resolver o problema, ou seja,
  #quantas gerações ele irá criar até interromper o programa, independente se chegou próximo da solução ou não
#monitor é um parâmetro simples para dizer se queremos acompanhar a evolução/resolução do programa pelo console
#names é para dizermos os nomes do itens constados no 'problema' (Neste exemplo não faz tanto sentido)

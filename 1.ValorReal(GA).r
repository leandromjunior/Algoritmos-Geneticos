#install.packages("GA")

library(GA)

f<-function(x) # Essa fun��o recebe do algoritmo gen�tico(ga) o resultado da equa��o
                #e armazena o valor na variavel resultado (x � a entrada da fun��o)
{
  
  #equacao 2 * x + 5 = 20
  resultado = 2 * x + 5 

  if(resultado >= 20){
    return(20 - resultado) # Com este return, � poss�vel dar uma 'pista' para o
                           #algoritmo gen�tico saber se est� se aprox. ou nao da solu��o
  }
  else{
    return(resultado - 20)
  }
}

resultado = ga("real-value", fitness = f, lower=c(-20), upper=c(20), popSize = 10,
               maxiter = 20, monitor = T, names=c("a"))

summary(resultado)$solution

plot(resultado) #Mostrar o resultado graficamente

#real-value � o tipo do valor
#fitness recebe a fun��o ajuste
#lower(min) � o valor m�nimo que o algoritmo deve retornar durante as tentativas de achar a solu��o
#upper(max) � o valor m�ximo que o algoritmo deve retornar durante as tentativas de achar a solu��o
#popSize � o tamanho da popula��o, ou seja, n�mero de cromossomos
# maxiter � a quantidade de vezes que o algoritmo tentar� resolver o problema, ou seja,
  #quantas gera��es ele ir� criar at� interromper o programa, independente se chegou pr�ximo da solu��o ou n�o
#monitor � um par�metro simples para dizer se queremos acompanhar a evolu��o/resolu��o do programa pelo console
#names � para dizermos os nomes do itens constados no 'problema' (Neste exemplo n�o faz tanto sentido)

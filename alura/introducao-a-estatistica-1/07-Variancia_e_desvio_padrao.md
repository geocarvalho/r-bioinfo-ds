Já começamos a discutir por que apenas a média não é o suficiente ao compararmos duas distribuições, pois, apesar de nos informar a Tendência Central, não indica o quão espalhados estão os dados a partir dessa média. E precisamos saber disso para conseguirmos comparar os dados de João e José. Qual deles tem um ritmo de trabalho mais adequado à vaga na empresa? Qual possui uma frequência melhor?

Anteriormente, tentamos resolver esse desafio, e chegamos naquela fórmula da amplitude, em que subtraíamos o limite inferior do limite superior, e obtínhamos um número. No entanto, vimos que os Outliers atrapalham. O 30 do José, em particular, nos atrapalhou bastante. Para eliminar esses Outliers, chegamos na ideia da distribuição por quartis. Assim, descartamos os Outliers da esquerda e os da direita, e lidamos com os dados que se encontram no meio.

Vamos tentar pensar em uma maneira "elegante" de achar essa diferença, esse desvio da média que os números têm. Para tanto não usaremos o João, nem o José, e sim uma distribuição menor que facilite os nossos cálculos. Em uma distribuição (1, 2, 9), por exemplo, a média é 4.

De que modo é possível saber a variância média entre os números? Uma boa ideia seria verificar a distância do 1 em relação à média, que é 4. Então, o 1 está a 3 pontos — irei chamar de pontos — da média. De 2 para 4 faltam 2. De 9 para 4, 5.

Então, vamos calcular primeiro a distância de cada ponto da média, e depois a média desse número. Será a média da dispersão dos dados. Portanto, teremos [(4-1)+(4-2)+(4-9)]/3, cuja divisão por 3 se dá por ser esta a quantidade de elementos na distribuição. Isto nos trará (3+2-5)/3, o que resulta em 0.

Está aí o primeiro problema da nossa fórmula, pois há números à esquerda, à direita e, ao fazermos uma subtração da média, temos números negativos, que pode anular o número positivo. Não queremos que isso ocorra, e sim que cada ponto do gráfico tenha influência no valor final.

Como eliminar números negativos?
Uma maneira fácil para isso é colocá-los ao quadrado, pois desta forma qualquer número será sempre positivo!

```
[(4-1)^2+(4-2)^2+(4-9)^2]/3
[3^2+2^2+(-5)^2]/3
[9+4+25]/3
38/3 ~= 13
```

No exemplo acima, utilizamos valores arredondados para facilitar, e chegamos ao número 13, que é a primeira tentativa de indicar o quanto os números estão dispersos dessa média, na média. Porém, como elevamos esses números ao quadrado, não obtivemos um número em uma dimensão desejada. Então, é necessário calcular a raiz do valor (pois esta é a operação inversa de quanto lidamos com um número que é multiplicado por ele mesmo).

Se calcularmos a raiz de 13, obteremos aproximadamente 3,5, um valor útil que informa que os números dessa distribuição, na média, estão espalhados por 3,5 para lá e para cá. Na Estatística, ambos os valores possuem um termo específico — variância e desvio padrão, respectivamente.

Mais importante do que decorar a fórmula, foquemos na ideia de como o desvio padrão funciona: ele tenta descobrir a distância daquele ponto em relação à média, para todos os pontos, calculando a média disso. Isso nos dá a dispersão da nossa distribuição, com que poderemos fazer comparações.

Ao calcularmos o desvio padrão e a variância de João e José, chegaremos aos seguintes valores:

```
João 1,73
José 7,02
```

Deles, conclui-se que o João é mais consistente, pois o desvio padrão dele é menor. A média é 10±1, então, quando o contratarmos, a chance dele consertar de 10, -1 para a esquerda e +1 para a direita, é grande, porque esse é o desvio. O José, por sua vez, tem comportamento mais instável, e possui média de 10, sendo que pode ter um dia muito produtivo e consertar 17. Da mesma forma, em um dia improdutivo é possível que ele conserte apenas 3.

Sendo assim, contratar o João provavelmente é a escolha mais segura. Nesse caso, em que buscamos maximizar o número de consertos, talvez ele seja uma aposta melhor.

Anteriormente, tínhamos duas distribuições - João e José -, cuja média era igual, isso nos dava a falsa interpretação de que eram iguais, no entanto o desvio padrão de cada um deles é diferente. É necessário nos atentarmos quando formos comparar duas distribuições. Não podemos levar em conta apenas a Tendência Central, mas também o desvio padrão desses dados, e por aí vamos entender como tal distribuição está se comportando.

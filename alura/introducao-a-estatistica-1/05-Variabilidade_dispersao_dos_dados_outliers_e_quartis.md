# 05 - Variabilidade, dispersão dos dados, outliers e quartis

Anteriormente, discutimos sobre Média Aritmética, mediana e moda. Vamos aplicar essas ideias para o nosso dia a dia. Imagine que trabalhemos em uma fábrica consertando aparelhos. Há uma vaga em aberto na empresa, e dentre os candidatos, estão o João e o José, dos quais temos alguns dados:

## João

| Frequência | Aparelhos consertados |
|------------|-----------------------|
| 1          | 7                     |
| 1          | 8                     |
| 1          | 9                     |
| 2          | 10                    |
| 2          | 11                    |
| 1          | 12                    |
| 1          | 13                    |

## José

| Frequência | Aparelhos consertados |
|------------|-----------------------|
| 2          | 3                     |
| 1          | 6                     |
| 2          | 7                     |
| 3          | 10                    |
| 1          | 11                    |
| 1          | 13                    |
| 1          | 30                    |

Em um dia, o João consertou sete aparelhos; em outro, ele consertou oito; em dois dias ele consertou dez, e em outra ocasião, em dois dias foram consertados 11, e assim por diante. Assim, temos a quantidade de aparelhos consertados por dia e a frequência disso.

E a mesma coisa para o José: em dois dias, ele conseguiu consertar três aparelhos; em outros três dias, consertou dez aparelhos, e houve um dia em que o José consertou 30, pois estava bastante produtivo.

Temos apenas uma vaga, e dois candidatos. Qual deles poderia ser escolhido?

Poderíamos utilizar a Média, mediana e moda. Por exemplo, poderíamos tentar descobrir a Média de consertos diários de cada um deles, e ver qual dos dois tem a maior Média, já que, teoricamente, queremos contratar alguém que conserte **mais** aparelhos.

Porém, calculando-se a Média, a moda ou a mediana dessas duas distribuições, com estes números, teremos o valor 10. Ou seja, independentemente do tipo escolhido, o resultado de ambos é o mesmo, e continuamos em dúvida sobre quem deveria ser contratado.

A Média é uma ótima maneira de obtermos a Tendência Central da uma determinada distribuição, mas ela não explica muito sobre como esses dados estão dispersos. Queremos saber que a pessoa conserta 7 aparelhos, sendo mais ou menos 3/dia, e esta é a Média. Esse "mais ou menos três" não está na Média nem na mediana, tampouco na moda. Precisaremos encontrar uma maneira de descobrir o quanto a nossa distribuição está "espalhada" para complementarmos a informação da Média.

Vamos começar da maneira mais simples: poderíamos, por exemplo, pegar o maior valor e subtrair do menor valor. Eu vou chamar isso de **amplitude**. Assim, a amplitude do João é `13-7=6`, e a do José é `30-3=27`. O 6 e o 27 nos dão uma noção do quanto esses dados estão espalhados.

Nesse exemplo, os dados do José variam bastante, pois há números grandes e pequenos. Assim, a amplitude é muito grande. Já os de João têm uma consistência maior; ele sempre produz mais ou menos a mesma quantidade por dia, por isso o seu valor é 6.

No entanto, o cálculo do maior elemento da distribuição (limite superior) menos o menor elemento da distribuição (limite inferior) acaba sendo simplório por ser fácil de ser manipulado.

O José conserta 3, 6, 7, 10, 11, 13 e, de repente, 30. Ou seja, ele teve um dia excepcional no trabalho e conseguiu consertar 30 aparelhos, foi uma exceção, não é algo que acontece sempre. Esse único valor acaba influenciando a amplitude.

Quando lidamos com uma distribuição, precisamos sempre nos preocupar com esses dados que estão muito fora da curva. Em inglês, isso é conhecido por Outlier, e ele pode atrapalhar o cálculo.

Antes de chegarmos a uma maneira interessante de se calcular essa dispersão, entenderemos como podemos filtrar esses Outliers. No caso do José, como descartaríamos esse 30? Além disso, apesar de ser difícil afirmar, o 7 também pode ser um Outlier. Trata-se de valores que destoam dos demais. É preciso uma maneira "procedimental", um jeito mecânico de não termos que lidar com estes Outliers.

Para tal, usamos a **distribuição por quartis**, isto é, dividiremos a distribuição em **4 pedaços**.

No caso do José, podemos escrever todos os números da sua tabela de frequência, e esta será a sua distribuição:

`3 3 6 7 7 10 10 10 11 13 30`

Queremos dividi-la em 4 pedaços, sendo que temos, ao todo, 11 elementos.

Não conseguiremos fazer a divisão em 4 partes exatamente iguais. A proporção será de 25% para a esquerda, 25% para a direita e 50% no meio. Se desconsiderarmos os 50%, somos levados a crer que que os números muito pequenos farão parte desses 25% primeiros, enquanto os números maiores estarão nos 25% do fim. Usaremos somente os 50% do meio da distribuição, área em que temos alguma certeza de que não há nenhum Outlier. Isso é o que chamamos de **distribuição por quartis**.

Agora, vamos calcular os lugares exatos, começando pela contagem do número de elementos, que é 11. Então, precisamos encontrar a posição do **primeiro quartil**. É fácil descobri-lo: pegaremos o total de elementos da distribuição, 11, e o dividiremos por 4, que são os números de quartis. Isso nos dá 2,75, que arredondado para cima dá 3, e esta é a posição do primeiro quartil.

`3 3 (6) 7 7 10 10 10 11 13 30`

Agora, precisamos achar o que chamamos de terceiro quartil. Faremos isso com 3n/4, pois queremos que 3/4 dos dados estejam antes desse terceiro quartil. Então, teremos 33/4=8,25, que arredondaremos para 9.

`3 3 6 7 7 10 10 10 (11) 13 30`

E o que está no meio é o que acabamos usando nas nossas contas, pois `7, 7, 10, 10, 10` não envolve um Outlier, e isso representa melhor a nossa distribuição.

A distibuição por quartis traz como vantagem a eliminação dos nossos Outliers. Esse tipo de informação é tão comum que existe um gráfico bastante usado no dia a dia, chamado de **boxplot**. Ele nos passa todas essas informações de uma única vez: o primeiro quartil, o terceiro quartil, a média, e por aí vai.

Vamos desenhar o *boxplot* para o caso do José. Trabalharemos com um gráfico de eixo, e por ora nos importaremos apenas com o eixo Y. Começaremos incluindo o menor valor da distribuição, que é o `3`. O próximo número será o do primeiro quartil, `7`. Faremos um traço deste para o número `3`.

Representaremos o terceiro quartil com o `11`, com o qual fecharemos um formato de caixa. No topo, incluiremos o maior valor da distribuição, que nesse caso é `30`, um valor bem fora da curva. E no meio desse gráfico acrescentaremos também a nossa mediana, , no caso, `10`.

Por meio do boxplot, temos as seguintes informações:

o **menor** valor da distribuição (limite inferior);
o **maior** valor da distribuição (limite superior);
o **primeiro quartil**;
o **terceiro quartil**;
a **mediana**.

![graph](https://s3.amazonaws.com/caelum-online-public/Estat%C3%ADstica+1/est1_5_1.png)

Assim, esse gráfico é bastante famoso pela clareza em demonstrar dados de uma distribuição.

Neste gráfico em específico, a distância do número `30` nos dá a noção de que lidamos com *Outliers*. O *Outlier* inferior é pequeno, porque a distância no gráfico também é, mas em relação ao limite superior ela é grande, o que comprova a existência de Outliers, portanto realmente precisamos pensar em **quartis**.

Quando queremos comparar duas distribuições, a **média** não é o suficiente, pois apesar de nos dar a Tendência Central, ainda é necessário que saibamos o quanto esses dados **variam** na distribuição. E assim começamos a discussão de como chegar nessa **variância**.

Já entendemos que o cálculo simples de amplitude (o limite superior menos o limite inferior) é facilmente influenciado pelos Outliers. Depois, chegamos à **distribuição por quartis**, cuja ideia é eliminar tais Outliers, excluindo 25% dos dados da esquerda da distribuição, 25% dos dados da direita, e usando os 50% centrais.

Aprendemos a calcular o primeiro e o terceiro quartis:

* para o **primeiro quartil**, devemos divir o tamanho da distribuição por `4`, e caso o resultado seja um valor quebrado, deverá ser arredondado para cima.
* para o **terceiro quartil**, usaremos `3n/4`, também arredondando-se o resultado caso seja um valor quebrado.
Também calculamos a **mediana** e, por fim, desenhamos um **boxplot**.

> Fica para vocês como lição de casa desenhar o *boxplot* do João, que por sua vez tem um caso engraçado. Sendo o limite inferior 7, qual é o **primeiro quartil**? Depois, coloquem um *boxplot* ao lado do outro, pois isso facilitará a comparação entre os dois.

Veremos adiante como calcular a **variância** dessas duas distribuições. Até a próxima aula!

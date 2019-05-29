# Média, mediana e moda
## Média
Muito provavelmente você já deve ter estudado esse assunto na escola, e se pedirmos para você calcular a média, por exemplo, de 1, 2, 3 e 4, fará:

`(1 + 2 + 3 + 4)/4 = 10/4 = 2,5`

Portanto, de modo geral, teremos:

`(x1 + x2 + x3 + ... + xn)/n`

Será mesmo que, para todo conjunto de números, devemos utilizar a **Média Aritmética** para encontrarmos uma **Tendência Central**? Talvez. Devemos saber que tipo de dado possuímos, lembra-se da primeira aula de Estatística? A média serve para dados Ordinais ou Intervalares? Vejamos um exemplo:

Imagine que você é um professor, e que no final da aula você entrega um formulário para os alunos preencherem com a nota que eles te dariam, em um intervalo de 1 a 10:

`Nota: ( )1 ( )2 ( )3 ( )4 ( )5 ( )6 ( )7 ( )8 ( )9 ( )10  [dado do tipo Ordinal]`

Segue que:

* 1º aluno: 10
* 2º aluno: 1
* 3º aluno: 1
* 4º aluno: 1
Fazendo a média:

`(10 + 1 + 1 + 1)/4 = 3,25`

Não é estranho? O 10 dado pelo primeiro aluno não parece exceção? Você é, claramente, um professor nota 1! Perceba que escolher a Média Aritmética sem levar em conta o tipo de dado pode te levar a uma informação estranha.

Veja outro exemplo que pode nos enganar:

Em uma empresa, os salários dos funcionários são como se segue:

* 1º funcionário: 2000 reais
* 2º funcionário: 2000 reais
* 3º funcionário: 2000 reais
* 4º funcionário: 100.000 reais
Calculando a média:

`100.000 + 2000 + 2000 + 2000/4 = 26500`

Você diria que a média dos salários da empresa é de 26500 reais? Não, porque 100.000 reais é uma exceção, e confunde a média real. Chegamos à conclusão de que precisamos pensar em outras soluções para o cálculo da Tendência Central de um conjunto de dados. A Média Aritmética é totalmente sensível aos valores que chamamos de outliers, ou pontos fora da curva.

A seguir, veremos outras maneiras de calcular a tendência central de um conjunto de dados.

## Mediana
Para o cálculo da mediana, colocamos os valores dados em ordem crescente e escolhemos aquele que é central. Isso é fácil para quantidades ímpares de dados, pois haverá um número localizado bem no meio da amostra. Veja um exemplo:

`1 1 6 1 5 10 1 1 1`

Em ordem crescente:

`1 1 1 1 1 1 5 6 10`

O valor central é o 1, que é a nossa mediana. Para quantidades pares de dados, pegamos os dois valores centrais e calculamos sua Média Aritmética:

`1 1 5 1 2 10 1 6`

Em ordem crescente:

`1 1 1 1 2 5 6 10`

Os valores centrais são, respectivamente, 1 e 2. A média entre eles é 1,5, e esta é a mediana que queríamos encontrar. Perceba que ela é menos suscetível aos outliers. Obviamente, não significa que a Média Aritmética não é uma boa medida de Tendência Central. Se sua distribuição é estável, a Média pode ser boa.

Então, como saber qual das duas usar? Inicialmente, verifique se os outliers são muito grandes e distantes do resto da amostra. Outra regra é que, se o tipo de dado for Ordinal, a média não é um bom método.

## Moda
A moda é o elemento que mais se repete na distribuição:

`1 1 2 2 2 2 2 3 3 5 5 5`

Nessa amostra, o número 2 é o que mais se repete, logo ele é a nossa moda. Esta pode ser uma maneira honesta de se calcular a medida de Tendência Central.

Você irá perceber que, em uma amostra bem distribuída, a média, mediana e moda são iguais ou possuem valores muito próximos.

## Dicas:
* Com dados Ordinais usamos mediana ou moda;
* Utilizamos a Média Aritmética em dados Intervalares, salvo aqueles que possuam *outliers*;
* Desenhe um histograma e verifique se consegue desenhar uma linha parecida com a Normal. Se você tiver uma **distribuição normal**, o cálculo da média é um método razoável.

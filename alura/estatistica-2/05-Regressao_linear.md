# 04 - Regressão linear

Na aula passada vimos Correlação, ou seja, quando uma variável influencia a outra, elas têm alguma relação. Nesta aula veremos como prever valores utilizando a correlação como ferramenta.

Imagine que queremos saber o valor de um apartamento, sabendo de antemão que quanto maior ele for, mais caro ele é, segundo o gráfico abaixo:

[!graph1]()

Um apartamento de 63 metros quadrados, qual será o valor dele seguindo a proporção mostrada no gráfico?

Nós traçamos aquela melhor reta pelos pontos já obtidos e calculamos sua função f(x). Sabendo essa função, basta calcularmos f(63) para prever o valor do apartamento, esse será o melhor chute.

[!graph2]()

Chamamos isso de *Regressão Linear*, que tem esse nome pois toda função que acharemos será linear, ou seja, de primeiro grau:

`f(x) = ax + b`

Onde:

* b é uma constante, o coeficiente linear da reta
* a é o coeficiente angular da reta

> usamos regressão linear para entender como duas variáveis funcionam, e tentar prever possíveis números que não estão dentro da distribuição atual. A ideia por trás da regressão linear é encontrar a melhor função de primeiro grau, que explica a distribuição dos dados;

> Você pode enxergar algum problema com a regressão linear? Qual?

* O problema é que às vezes uma simples função de primeiro grau pode não ser suficiente. É por isso que antes de aplicá-la, você deve olhar a distribuição (por exemplo através do `Scatterplot`) e ver o quanto a função realmente se aproxima dos pontos já conhecidos.


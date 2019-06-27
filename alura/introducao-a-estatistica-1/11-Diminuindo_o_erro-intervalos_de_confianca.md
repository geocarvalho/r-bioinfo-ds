# 11 - Diminuindo o erro: intervalos de confianca

Até o momento, tínhamos um histograma cuja população era representada por uma curva azul. No mesmo gráfico, a amostra é uma curva similar, porém menos acentuada.

[!hist](https://cursos.alura.com.br/course/introducao-a-estatistica-1/task/6932)

Supondo que a média da amostra seja `7`, e que ela é praticamente a mesma que a da população, imaginemos que, por algum motivo, tivemos acesso à média da população, e descobrimos que ela é de `7,3`, isto é, há uma pequena diferença entre os valores, o que faz sentido, porque a amostra não é a população inteira, e estramos trabalhando com estimativa.

Não lidamos com certezas, e para não termos uma margem de erro tão grande, preferimos trabalhar com **intervalos**. Assim, em vez de indicarmos que temos certeza de que a média dessa população é 7, optaremos por informar que a média dessa população está **entre 6 e 8**, e com isto temos por volta de `95%` de certeza de que isso é verdade.

Na prática, raramente a média da amostra é idêntica à média da população. Por isso, usamos o que chamamos de **intervalo de confiança**. No exemplo anterior, o intervalo de confiança é de 6 a 8. E esses 95% é conhecido por **nível de confiança**. Obviamente, um se relaciona ao outro, já que teremos um intervalo maior ou menor dependendo do nível de confiança desejado.

Entretanto, pensar no nível de confiança é algo complicado, justamente por não podermos indicá-lo com certeza absoluta. Então, se definirmos um nível de confiança muito alto, o que acontece com o intervalo? Ele se expandirá. A única maneira de termos 100% de certeza é trabalhar com um intervalo bastante grande. No entanto, isso acaba comprometendo o intervalo, que fica generalizado demais. Por exemplo, se dissermos que a altura do brasileiro varia de 30cm a 2,5m, aumentamos o intervalo de confiança e também o nível, já que isso pode ser garantido com 100% de certeza. Porém, esse dado não é nada relevante.

Em contraponto, se indicarmos que a média da altura do brasileiro fica entre 1,70m e 1,71m, também precisaremos dizer que a confiança é de 10%. Isto é, será necessário balancear o nível de confiança. Via de regra, costuma-se usar 95%, número bastante aceito por diversas comunidades.

Dada uma distribuição, como calcularemos o intervalo de confiança?

Em um histograma, com uma curva Normal, a média se encontra no centro, que é a parte mais alta. E então, há os desvios padrão, que geralmente são três, tanto para a direita quanto para a esquerda. Na Estatística, o cálculo desses intervalos de confiança é feito com base nessa curva Normal, e probabilidade. Como assim? Levando-se em consideração que o eixo horizontal indica a altura da população brasileira, a pessoa que se encontra no extremo direito é alguém absurdamente alto, com cerca de 2,30m de altura. A partir desta curva, tentamos descobrir a probabilidade de termos um número onde está marcado 2,30m, conhecendo a frequência de cada uma das alturas das pessoas.

[!hist2](https://s3.amazonaws.com/caelum-online-public/introducao-a-estatistica/amostra-de-probabilidade.png)

Quando dizemos que o nível de confiança é de 95%, significa que há 95% de chances de termos um número nesse intervalo de 6 a 8. Quando indicamos 100% de nível de confiança, dizemos que a chance do número estar nessa curva é de 100%, considerando todo o contexto. Então, com 100% de confiança geralmente começa com uma altura de 30cm (extrema esquerda do gráfico), e acabamos em 2,30m (extrema direita).

Considerando três desvios padrão para a esquerda e três para a direita, obtemos a média. Isso dá por volta de 99,7% da distribuição. Quando trabalhamos com 95%, considera-se por volta de 2,5 desvios padrão para cada lado da distribuição.

Calcular um intervalo de confiança não nos importa neste momento, pois não nos aprofundaremos na matemática, mas, basicamente, isso é feito com probabilidade.

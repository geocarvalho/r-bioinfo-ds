# 09 - População x amostra: pensando em um estudo

Após todo esse aprendizado, seria interessante começarmos a aplicá-lo, não? Afinal, a estatística pode ser utilizada para entendermos como determinado grupo se comporta. Imaginemos que queremos realizar um estudo para descobrir qual é o time de futebol brasileiro com mais torcida, ou então, o prefeito ou presidente com maiores chances de votos. Será necessário ir às ruas e falar com essas pessoas.

E é aí que entra o problema. Dará um trabalho imenso descobrir qual é o time de futebol mais popular no Brasil inteiro. Para sabermos isso com exatidão, teríamos que perguntar para os mais de 200 milhões de brasileiros para que time eles torcem. É impossível, certo?

1. é extremamente difícil conseguir falar com 200 milhões de pessoas;
2. mesmo que conseguíssemos, provavelmente isso custará muito dinheiro.

Queremos entender como uma determinada população se comporta, isto é, há um conjunto total de pessoas que queremos estudar, mas não tenho acesso à população inteira. Como fazer? O grande segredo da estatística é encontrar uma boa **amostra**, um conjunto de pessoas que de alguma maneira represente essa população, e fazer o estudo em cima dessa amostra, a partir do qual conseguimos generalizar os números encontrados.

No entanto, isso não é tão fácil quanto parece. Como dito anteriormente, existe uma frase provavelmente familiar:

> Existem mentiras, grandes mentiras e estatísticas

Uma maneira muito fácil de errar é justamente escolhendo uma má amostra. Supondo que queiramos descobrir qual o time de futebol preferido do Brasil, e decidamos entrevistar nossa própria família. Muito provavelmente todos torcem para o mesmo time. Essa seria uma amostra errada, e nós, como pesquisadores e estatísticos, precisamos saber escolhê-la de forma adequada.

Uma amostra, idealmente, deve ser **randômica**, de forma que quando lidamos com uma população inteira, e queremos "pedaços" dessa população, lidemos com "pedaços" específicos, que sejam bem representativos do todo. Por exemplo, não é interessante entrevistar o irmão, pois ele faz parte de uma esfera muito próxima do nosso universo pessoal. Isto siginifica que qualquer um que estiver dentro dessa população tem que ter a mesma chance de ser escolhido para compor a amostra. E isso não é algo tão fácil, dependendo do estudo que se quer realizar.

Para fazermos um estudo com os 200 milhões de brasileiros, idealmente consultaríamos a lista telefônica e escolheríamos um nome, de maneira randômica. Mesmo assim, esta escolha talvez tenha um viés, por conta de possíveis variáveis, como deixar de lado a pessoa que mora em uma região muito pobre e sem acesso a telefone, por exemplo.

Em um contexto menor suponhamos que queremos descobrir como os alunos de uma determinada escola se comportam. Estamos lidando com cerca de 500 alunos, dos quais precisamos escolher um, de forma aleatória. Chamamos isso de **amostra randômica**. Se queremos descobrir qual o melhor professor da escola, e existem aulas nos turnos da manhã, tarde e noite, consultar apenas os alunos de um único turno pode trazer problemas. Esse grupo de pessoas pode ter opiniões contraditórias e diferentes, então temos que tomar cuidado com todas essas possibilidades.

Outra maneira conhecida de obtermos a amostra é fazer o que chamamos de **amostra estratificada**. Como assim? Usando o exemplo anterior, do estudo em uma escola, temos as turmas da manhã, da tarde e da noite. Então, separaremos os alunos de acordo com o turno, e depois criamos subgrupos randomizados, para garantir que tenhamos alunos de cada turno.

Generalizando mais uma vez: em um estudo sobre times de futebol do Brasil, entrevistamos habitantes do Sudeste para baixo. É um tanto óbvio que os resultados trarão São Paulo, Corinthians, Grêmio, Internacional. A probabilidade de alguém dizer que torce para o Sport, por exemplo, é mínima, pois pessoas do Nordeste não tiveram participação no estudo. Se fóssemos fazer uma amostra estratificada no país, trabalharíamos amostras de habitantes em partes distintas do país.

Vamos entender aquele nosso desenho, e como ficaria o nosso gráfico? O histograma nos indica, mais ou menos, a frequência pela variável que medimos, como a altura da população. No eixo X (horizontal), temos a altura, e no Y (vertical), a frequência. Quantas pessoas têm 1,50m? Quantas têm 1,60m, 1,70m? Já sabemos que se a nossa distribuição for Normal, a nossa curva começa embaixo, sobe, e depois volta a abaixar.

[!graph](https://cursos.alura.com.br/course/introducao-a-estatistica-1/task/6927)

Imaginemos que a curva seja a população. Quando selecionamos a amostra menor, e pronta para ser estudada, supomos que o seu histograma possua duas curvas, uma maior e outra menor, ambas seguindo mais ou menos o mesmo formato.

[!graph2](https://cursos.alura.com.br/course/introducao-a-estatistica-1/task/6927)

Vamos considerar que seja uma Normal também, só que com menos dados — é essa a diferença da população para a amostra. Sabendo disso, queremos calcular os dados para a amostra que contém os números, e generalizar para a população. A média da amostra, dado que as distribuições são Normais, é igual à média da população. Simples assim.

Entretanto, precisamos nos questionar sobre a variância, que é mais ou menos quando os números estão espalhados no gráfico. Nesse caso, como sabemos que a população é muito maior e provavelmente existem Outliners, temos uma fórmula um tanto diferente de calcularmos a variância.

Para calcularmos a variância, usávamos a diferença de cada número para obtermos a média, e dividíamos isto pelo número de elementos. Neste caso, usaremos um exemplo anterior:

* 1, 2 e 9
* Média: 4

Então teremos ((4-1)+(4-2)+(4-9))/3. Daí, nos deparávamos com aquele problema de que no último parênteses da fórmula o número fica negativo, um cancela o outro, e nós resolvíamos isso elevando o número ao quadrado.

```
(4-1)²+(4-2)²+(4-9)²
```

A diferença é que nós acrescentamos um -1:

```
((4-1)²+(4-2)²+(4-9)²)/(3-1)
```

Esse `-1` é a diferença que usamos para calcular a variância da amostra. Trata-se de uma convenção da Estatística e, grosso modo, a ideia é que, se tirarmos o número `1`, o resultado final dessa conta será um número maior, certo? Se fizermos a divisão por `2`, o resultado será maior do que se dividirmos por `3`. Isso porque sabemos que a variância da população é maior do que a da amostra.

E é por isso que tiramos um número na divisão, para que ele fique um pouco maior e, por consequência, mais parecido com o da curva de população. Resumindo, a média é igual, e a variância é calculada acrescentando-se `-1` na parte de baixo da divisão, para que o número fique maior e provavelmente muito mais parecido com o da população.

Vimos sobre as diferentes amostras, assunto fundamental em um trabalho de Estatística. Lembrando que não conseguimos alcançar uma população inteira, sendo necessário selecionar um conjunto de pessoas e, idealmente, essa amostra é representativa em relação à população geral.

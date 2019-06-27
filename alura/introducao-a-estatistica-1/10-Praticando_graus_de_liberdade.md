# 10 - Praticando: Graus de liberdade

Já vimos a diferença de população e amostra, sendo este o material que temos quando vamos fazer um estudo. Também entendemos que, em particular, a fórmula da variância muda se for para amostra ou para população. Usamos `n-1` no divisor e subtraímos `1` por acreditarmos que a variância da população seja maior do que a da amostra. E, então, este `-1` faz com que o número fique maior, e acreditamos que isso seja mais próximo da variância da população.

Em inglês, esse `n-1` é o que chamamos de *Degrees of Freedom*, ou **graus de liberdade**.

Imaginemos que temos quatro números desconhecidos: `x, y, z e t` que, em uma planilha do Excel, seria A2, B2, C2, D2, respectivamente. Sabemos que a soma desses números é `10`. Que número podemos definir como sendo o `x`, o primeiro deles? O número pode ser qualquer um. Se escolhermos 600, buscaremos uma combinação de outros três números cuja soma resultará em `10`.

Vamos supor que `x` seja 3. O próximo número, `y`, também pode ser qualquer um. Neste caso, imaginemos que seja `2`. Da mesma forma, definiremos que `z` seja 1, arbitrariamente. Para o quarto número, ficamos limitados ao número `4`, para que a soma de todos dê `10`. Então, em um âmbito de quatro números, três podem ser escolhidos com alguma liberdade — é isso que são os graus de liberdade, e isso aparece em vários momentos da Estatística.

Estamos com um grau de liberdade que é o `n-1`, e temos um grau a menos de liberdade do que na fórmula da população. Uma vez que na variância a fórmula é a soma da diferença do número para a média ao quadrado, dividido por n, em uma situação em que sabemos que a soma é `240` supomos que `n = 4`. Sendo assim, na fórmula da população teremos `240/4`. E na fórmula da amostra, `240/3`.

* n = 4
* População: 240/4 = 60
* Amostra: 240/3 = 80

Para `n = 8` teremos:

* População: 240/8 = 30
* Amostra: 240/7 = 34,28571429

E para `n = 20`:

* População: 240/20 = 12
* Amostra: 240/19 = 12,6317895

Com `n = 4` e `n = 8`, a diferença é bastante grande. Quando usamos `n = 20`, os valores ficaram bem próximos. O que acontece com `n = 120`?

* n = 120
* População: 240/120 = 2
* Amostra: 240/119 = 2,016806723

A diferença entre os valores cai para `0.01`. Isso quer dizer que se a amostra conta com mais de 120 pessoas, não precisamos mais nos preocupar tanto com aquele `-1`, pois os números são parecidos. Então, quando alguém diz que existem `4` graus de liberdade, quer dizer que `4` variáveis estão "livres", e podem ser alteradas à vontade.

Assim, não se preocupem tanto se a fórmula da variância comum for utilizada, porque dependendo do tamanho da amostra, isso não trará tanto impacto.

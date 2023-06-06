# Código completo:
- [DAO do estado - sem associção](estado_dao_sqlite.dart)<br>
- [DAO do cidade - tem associação com estado](cidade_dao_sqlite.dart)<br>
- [DAO do contato - tem associação com cidade](contato_dao_sqlite.dart)<br>

# Entendendo o código
<p>É muito comum que, com o uso de framework, ele já faça tudo!!! O que é bom, pois você não tem trabalho, mas é ao mesmo tempo é péssimo, pois geralemnte você não entende nada.</p>
<p>Desenvolvendo tudo na mão como este projeto, sem framework de mapeamento, temos a oportunidade de entender passo a passo!</p>

## Qual a diferença entre DAO com ou sem associação?
<p>A grande diferença que precisamos entender é que o projeto é Orientado a Objeto e o BD é relacional. Assim, enquanto que a classe tem associação de um outro objeto (exemplo: Cidade tem o atributo Estado), no BD, uma tabela associa por meio da Foreign Key - uma coluna do tipo int (exemplo: tabela Cidade tem a coluna do tipo int → estado_id).</p>

## Entenda o ponto principal
O principal ponto a entender é a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona!<br>
Então preste atenção neste ponto e vamos aos detalhes do código!!!<br>

# DAO com associação:
- [método converter](converter.md)<br>
- [DAO do cidade](cidade_dao_sqlite.dart)<br>
- [DAO do contato](contato_dao_sqlite.dart)<br>

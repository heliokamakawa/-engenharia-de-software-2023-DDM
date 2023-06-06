# Código completo:
- [DAO do estado - sem associção](estado_dao_sqlite.dart)<br>
- [DAO do cidade - tem associação com estado](cidade_dao_sqlite.dart)<br>
- [DAO do contato - tem associação com cidade](contato_dao_sqlite.dart)<br>

# Entendendo o código:
## Qual a diferença entre DAO com ou sem associação?
<p>É muito comum que, com o uso de framework, ele já faça tudo!!! O que é bom, pois você não tem trabalho, mas é ao mesmo tempo é péssimo, pois geralemnte você não entende nada.</p>
<p>Desenvolvendo tudo na mão, sem framework de mapeamento, temos a oportunidade de entender passo a passo!</p>
<p>A grande diferença que precisamos entender é que o projeto é Orientado a Objeto e o BD é relacional. Assim, enquanto que uma classe tem associação de um outro objeto (exemplo: Cidade tem o atributo Estado), no BD, uma tabela associa por meio da Foreign Key - geralmente uma coluna do tipo int (exemplo: tabela Cidade tem a coluna do tipo int → estado_id).</p>
Então preste atenção neste ponto e vamos aos detalhes do código!!!

## Entenda o ponto principal
A principa ponto a entender é a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona!<br>

# DAO com associação:
- [método converter](converter.md)<br>
- [DAO do cidade](cidade_dao_sqlite.dart)<br>
- [DAO do contato](contato_dao_sqlite.dart)<br>

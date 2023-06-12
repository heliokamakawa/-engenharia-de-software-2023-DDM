# Defina os DAOs necessários
## Código completo:
- [DAO do estado - sem associção](estado_dao_sqlite.dart)<br>
- [DAO do cidade - tem associação com estado](cidade_dao_sqlite.dart)<br>
- [DAO do contato - tem associação com cidade](contato_dao_sqlite.dart)<br>

# Entendendo o código
<p>É muito comum que, com o uso de framework, ele já faça tudo!!! O que é bom, pois você não tem trabalho, mas ao mesmo tempo é péssimo, pois geralemnte não entendemos o código/processo envolvido.</p>
<p>Desenvolvendo tudo na mão como este projeto, sem framework de mapeamento OR, temos a oportunidade de entender passo a passo!</p>

## Qual a diferença entre DAO com ou sem associação?
<p>DAO sem associção tem atributos que geralmente são idênticas tanto no projeto como no BD.</p>
<p>Já no DAO com associação, precisamos entender que o projeto é Orientado a Objeto e o BD é relacional. Enquanto que a classe tem associação de um outro objeto (exemplo: Cidade tem o atributo do tipo objeto Estado), no BD, uma tabela associa por meio da Foreign Key - uma coluna do tipo int (exemplo: tabela Cidade tem a coluna do tipo int → estado_id). Desta forma, logicamente, como há diferença entre o projeto e o BD, precisamos entender e converter estes valores.</p>

## Entenda o ponto principal
O principal ponto a entender é a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona!<br>
Então preste atenção neste ponto e vamos aos detalhes do código!!!<br>

# DAO com associação:
- [método converter](converter.md)<br>
- [DAO do cidade](cidade_dao_sqlite.dart)<br>
- [DAO do contato](contato_dao_sqlite.dart)<br>

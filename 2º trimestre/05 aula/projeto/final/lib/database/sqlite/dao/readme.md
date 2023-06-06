# Código completo:
- [DAO do estado](estado_dao_sqlite.dart)<br>
- [DAO do cidade](cidade_dao_sqlite.dart)<br>
- [DAO do contato](contato_dao_sqlite.dart)<br>

# Entendendo o código:
## Qual a diferença entre DAO com ou sem associação?
<p>É muito comum que, com o uso de framework, ele já faça tudo!!! O que é bom, pois você não tem trabalho, mas é ao mesmo tempo é péssimo, pois geralemnte você não entende nada.</p>
<p>Desenvolvendo tudo na mão, sem framework de mapeamento, temos a oportunidade de entender passo a passo!</p>
<p>A grande diferença que precisamos entender é que o projeto é Orientado a Objeto e o BD é relacional. Assim, enquanto que uma classe tem associação de um outro objeto (exemplo: Cidade tem o atributo Estado), no BD, uma tabela associa por meio da Foreign Key - geralmente uma coluna do tipo int (exemplo: tabela Cidade tem a coluna do tipo int → estado_id).</p>
Então preste atenção neste ponto e vamos aos detalhes do código!!!

### Método converter
Entenda o PONTO CRÍTICO >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como framework funciona!<br>
- no resultado a associção é do tipo int → estado_id (banco de dados - fk do estado);
- o projeto é Orientado a Objeto, então precisamos, ao invés de int, um objeto do tipo Estado;
Como fazemos isso???
O método RECEBE como PARÂMETRO o resultado que vem do BD → - valores da tabela estado e não objetos.<br>
```dart
 converter(Map<dynamic,dynamic> resultado) async {
//resultado traz os valores da cidade! Que tem a Foreign Key do estado. No caso, estado_id - coluna do tipo int.
```

O método RETORNA o OBJETO Cidade, pois o nosso projeto é Orientado a Objeto.<br>
```dart
Future<Cidade> converter...
//o objeto cidade precisa ter o OBJETO estado e não a coluna do tipo int.
```

 
```dart
Future<Cidade> converter(Map<dynamic,dynamic> resultado) async {
    
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
    return Cidade(
      id : resultado['id'],
      nome: resultado['nome'],
      estado: estado
    );
  }
```

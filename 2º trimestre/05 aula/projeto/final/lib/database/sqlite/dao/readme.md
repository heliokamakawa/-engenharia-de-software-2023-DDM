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
Entenda o PONTO CRÍTICO, no caso, a >>>ASSOCIAÇÃO<<< - entendendo isso ficará fácil e saberá como qualquer framework funciona!<br>
O método converter RECEBE como PARÂMETRO o resultado que vem do BD → valores da tabela cidade e não objetos.<br>
```dart
 converter(Map<dynamic,dynamic> resultado) async {
/*
O parâmetro resultado traz os valores da cidade, que tem a Foreign Key do estado - o estado_id. 
estado_id é um valor da coluna do BD do tipo int, >>>NÃO É O OBJETO ESTADO
*/
```

O método converter RETORNA o OBJETO Cidade, pois o nosso projeto é Orientado a Objeto.<br>
```dart
Future<Cidade> converter...
//o objeto cidade precisa ter o OBJETO estado e não a coluna do tipo int.
```
Assim precisamos "converter" a Foreign Key que vem do banco para um Objeto Estado! Como???<br>
(1) criamos um objeto estado;<br>
(2) para preencher este objeto, usamos o método consultar por id do DAO do estado.<br>
```dart
    Estado estado = await EstadoDAOSQLite().consultar(resultado['estado_id']);
    /*
    Estado estado → definindo o objeto estado
    = await → como o método é assíncrono, ordenamos "esperar" (await)
    EstadoDAOSQLite().consultar →  consultar do dao estado
    resultado['estado_id'] → o id do estado específico da cidade
    o método consultar do DAO do estado irá:
    (1) irá buscar os dados estado conforme o id (estado_id) que passamos;
    (2) converter os dados para o objeto estado;
    (3) retornar o objeto estado preenchido!!!
    */
```
Agora que temos o OBJETO estado e não a Foreign Key, inserimos/associamos a cidade que será retornada
```dart
    return Cidade(
      id : resultado['id'],
      nome: resultado['nome'],
      estado: estado   // associando o OBJETO estado a cidade
    );
```
Código completo
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

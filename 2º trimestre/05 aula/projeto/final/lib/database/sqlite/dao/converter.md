# Método converter
<p>Precisamos criar o método para converter para organizar os dados Orientado a Objeto (no projeto) que vem do BD que é relacional (que é uma FK).</p>
<p>Assim, o método deve RECEBER como PARÂMETRO o resultado que vem do BD. Atualmente as bibliotecas de BD retornam um tipo Map<dynamic, dynamic> em que, o primeiro dynamic é o nome da coluna e a segunda o valor da coluna.</p>

```dart
 converter(Map<dynamic,dynamic> resultado) async {
/*
O parâmetro resultado traz os valores da cidade, que tem a Foreign Key do estado - o estado_id. 
estado_id é a coluna do BD que possui um valor do tipo int, >>>NÃO É O OBJETO ESTADO. 
Exemplo: Tabela Cidade que tem o registro da cidade Maringá retornaria 
 {id: 1, nome: Maringá, estado_id: 1} >>> veja que estado_id é 1 referente ao estado do Paraná >>>NÃO É O OBJETO ESTADO. 
*/
```

O método RETORNA o OBJETO Cidade com o respectivo OBJETO Estado, pois o nosso projeto é Orientado a Objeto.<br>
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
[voltar](https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/tree/main/2%C2%BA%20trimestre/05%20aula/projeto/final/lib/database/sqlite/dao)

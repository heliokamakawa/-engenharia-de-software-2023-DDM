## Implementação DAO SQLite (SQFLite)

### VERIFIQUE AS Dependências/Bibliotecas → JÁ FIZEMOS NA IMPLEMENTAÇÃO DA CLASSE DE CONEXÃO)
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>
```cmd
flutter pub add sqflite
flutter pub add path  
```

## Definindo a classe DAO
### Criar um arquivo no projeto
Para organização, eu criei o arquivo chamado de "contato_dao_sqlite.dart" dentro de uma nova pasta "dao" da pasta "sqlite".
projeto<br>
- lib<br>
-- database<br>
--- sqlite<br>
---- dao<br>
----- contato_dao_sqlite.dart<br>

### criar a classe no arquivo criado
```dart
class ContatoDAOSQLite{

}
```
### Implementar a interface "ContatoInterfaceDAO"
→ Implementar a interface que definimos durante o desenvolvimento dos widgets. <br>
>Não esqueça de fazer a importação!
```dart
import 'package:persistencia/view/interface/contato_interface_dao.dart'; //importanção

class ContatoDAOSQLite implements ContatoInterfaceDAO{

}
```
### Criar os métodos da interface
→ Ao implementar a interface "ContatoInterfaceDAO" será necessário implementar todos os métodos da interface;<br>
→ "Create 4 missing overrrides".
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/interface_dao.png" alt="Alt text" title="imagem da interface dao">
Implementando os métodos, a nossa classe deverá ficar da seguinte forma:
```dart
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';

class ContatoDAOSQLite implements ContatoInterfaceDAO{
  @override
  Future<Contato> consultar(int id) {
    // TODO: implement consultar
    throw UnimplementedError();
  }

  @override
  Future<List<Contato>> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<Contato> salvar(Contato contato) {
    // TODO: implement salvar
    throw UnimplementedError();
  }
}
```
### Implementação consultarTodos
- Antes de mais nada, precisamos entender que na consulta, os dados retornados pelo SQFLite tem o formato de "map<dynamic,dynamic>".<br>
- O primeiro dynamic refere-se ao nome da coluna e o segundo o valor. <br>
>Exemplo: 
>Se tiver a tabela estado no BD, onde há uma coluna nome, com o registro PARANÁ, <br>
>na consulta, será retornado um map: {nome: 'PARANÁ'}<br>
- Assim, para facilitar as coisas, vamos criar o método de conversão que recebe este "map" e retorne a nossa classe "Contato".<br>
```dart
  Contato converterContato(Map<dynamic,dynamic> resultado){
    return Contato(
      id : resultado['id'],
      nome: resultado['nome'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar']
    );
  }
```
Agora sim, implementamos o "consultarTodos".
```dart
  @override
  Future<List<Contato>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Contato> lista = (await db.query('contato')).map<Contato>(converterContato).toList();
    return lista;
  }
```
#### IMPORTANTE SABER!!! - Implementação consultarTodos  
```dart
Database db = await  Conexao.criar(); 
/*
Aqui estamos pegando referência de Database - da nossa classe de Conexao. 
Lembre-se que, na 1º vez, database é criado e partir da 2º, o que foi criado na 1º vez, será reutilizado.
*/
```

```dart
db.query('contato')) 
// método do SQFLite para fazer a consulta de todos os contatos
```
```dart
.map<Contato>(converterContato).toList(); 
/*
o map é um método da biblioteca do dart que percorre uma lista, executa a função (que recebe como parâmetro) e retorna uma NOVA lista.<br>
no nosso caso, estamos: <br>
(1) percorrendo a lista do tipo map que veio da consulta no BD; <br>
(2) chamando o nosso método "converterContato" para converter map (de cada registro do resultado) para a nossa classe contato; <br>
(3) retornar uma nova lista do tipo contato.
E por fim, o map, de fato, retorna o tipo Iterable, e assim, precisamos chamar o método toList para convertê-lo em uma lista.
<br>
*/
```
### Implementação consultar

```dart
  @override
  Future<Contato> consultar(int id) async {
    Database db = await  Conexao.criar();
    List<Map> maps = await db.query('Contato',where: 'id = ?',whereArgs: [id]);
    if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
    Map<dynamic,dynamic> resultado = maps.first;
    return converterContato(resultado);
  }
```
#### IMPORTANTE SABER!!! - Implementação consultar

```dart
await db.query('Contato',where: 'id = ?',whereArgs: [id]);
/*
Para consultar um contato específico, passamos como parâmetro o nome e o valor do filtro de consulta. 
No caso, estamos informando que o nome da coluna é id, e o valor é id que vem do parâmetro.
*/
```

```dart
if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
/*
Aqui estamos validando se caso não tiver registro.
*/
```

```dart
 Map<dynamic,dynamic> resultado = maps.first;
/*
Armazenando resultado...
*/
```

```dart
return converterContato(resultado);
/*
Convertendo com o nosso método e retornando o contato.
*/
```
### Implementação excluir
```dart
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM contato WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }
```


### Implementação salvar

```dart

  @override
  Future<Contato> salvar(Contato contato) async {
    Database db = await  Conexao.criar();
    String sql;
    if(contato.id == null){
      sql = 'INSERT INTO contato (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql,[contato.nome,contato.telefone,contato.email,contato.urlAvatar]);
      contato = Contato(
        id: id,
        nome: contato.nome, 
        telefone: contato.telefone, 
        email: contato.email, 
        urlAvatar: contato.urlAvatar);
    }else{
      sql = 'UPDATE contato SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql,[contato.nome, contato.telefone, contato.email, contato.urlAvatar, contato.id]);
    }
    return contato;
  }
```



## Implementação 
### Dependências/Bibliotecas
Adicione as dependências necessárias:<br>
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>
```cmd
flutter pub add sqflite;
flutter pub add path;  
```
## Definindo script BD
### Criando arquivo do script BD.
Crie um arquivo no projeto para o script do BD. <br>
Para organização, eu criei o arquivo dentro de uma nova pasta "sqlite" da pasta "database". 
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_script.png" alt="Alt text" title="Optional title">

### Comandos SQL
No arquivo criado, defini os comandos para criar tabela(s) e registro(s) - uma para criar tabela e outro do tipo array para inserções.
```dart
//comando para criar tabela
const criarContato = '''
 CREATE TABLE contato(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';
//array de inserções
const insercoesCopntato = [
'''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''',
'''
INSERT INTO contato(nome, telefone, email, url_avatar)
VALUES ('Maitê','(11) 9 9632-8578', 'maite@email.com','https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924366_960_720.jpg')
''',
'''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Hortência','(11) 9 9562-3356','hortencia@email.com','https://cdn.pixabay.com/photo/2021/01/24/09/28/girl-5944691_960_720.jpg')
'''];
```
## Definindo a classe de Database
### Criar um arquivo no projeto
Para organização, eu criei o arquivo chamado de "conexao.dart" dentro de uma nova pasta "sqlite" da pasta "database".
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_arquivo.png" alt="Alt text" title="Optional title">

### criar a classe no arquivo criado
```dart
class Conexao{

}
```
### Definir atributos necessários
→ Como é um app local para um único usuário, vamos criar uma única conexão para todo o APP. Para isso, vamos definir o atributo de database e o de controle. 
> Como são atributos que serão utilizadas somente na classe, definimos o moficador de acesso privato "_".
```dart
import 'package:sqflite/sqlite_api.dart'; //importanção

class Conexao{
  static late Database _conexao;  //atributo do database
  static bool _fechado = true;    //atributo de controle
}
```
### definir a lógica de inicialização do Database
```dart
import 'package:sqflite/sqflite.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){     // a 1º vez, database é fechado, então 
         // definimos comandos para inicializar o database
      _fechado = false; // no atributo de controle, definimos que agora o database não é fechado
    }
    return _database; //retornamos o database
  }
}
```

### definir os comandos para inciar o database
```dart
import 'package:path/path.dart';
import 'package:persistencia/database/sqlite/scriptbd.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  //definindo o camminho do database
      //deleteDatabase(path);                                    //caso queira apagar tudo antes, descomente esta linha
      _database = await openDatabase(                  //chamando o método que que abre o database
        path,                                          // informando o caminho
        version: 1,                                    // versão
        onCreate: (db, v){                             // criando os elementos (tabelas e registros) do BD
          db.execute(criarContato);
          insercoesCopntato.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
}
```

## Alguns pontos imporntantes
### Uso do static
```dart
class Conexao{
  // os atributos estão com o modificador static porque são usados dentro do método estático
  // elementos static só aceitam elementos static
  static late Database _database; 
  static bool _fechado = true;

  //definimos static para gerar um único database para o app
  //static pertence a classe e não ao objetio - tomar cuidado com concorrência!!!
  static Future<Database> criar() async {
    if(_fechado){  
      // comandos para iniciar o database
      _fechado = false;
    }
    return _conexao;
  }
}
```
>>> só é possível verificar se o database é fechado com o uso do static
>>> com static, o elemento é da classe e assim, todos os objetos irão acessar este ponto!!! 
>>> se não usar o modificador static, cada objeto teria o seu próprio database e assim, não teria sentido verificar se é fechado.

### uso do async await
```dart
class Conexao{
  static Future<Database> criar() async { //como estamos utilizando o await dentro da função, precisamos tornar a função assíncrona, colocando async
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db'); // precisamos "esperar" (await) o resultado para seguir a execução
      _database = await openDatabase( // precisamos "esperar" (await) a abertuda do database para retorná-lo
       [...]
      );
      _fechado = false;
    }
    return _database;
  }
}
```

### é necessário entender cada parâmetro do openDatabase
acesse https://pub.dev/packages/sqflite e descubra 
- para que passamos o path?
- o que é para que serve o version? o que ocorre se mudar? 
- quando o onCreate é executado? A cada chamada do método criar, onCreate é executado?

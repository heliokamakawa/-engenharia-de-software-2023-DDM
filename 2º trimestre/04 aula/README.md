SQFLite
Material de estudo:
https://pub.dev/packages/sqflite
https://pub.dev/packages/path
https://balta.io/blog/flutter-sqlite
https://www.macoratti.net/19/08/flut_accsqlite1.htm

>>>>>Diário de Aula

@@@@ Diário de Aula
 - Descrever os pontos principais da classe de conexão (padrão utilizado, cuidados necessários, como funciona e como utilizar);
 - Descrever os pontos principais da classe DAO (padrão utilizado, cuidados necessários, como funciona e como utilizar);

@@@@ Desenvolvimento do Projeto
- Implementar o SQLite no seu projeto.

# Aula
>>>baixe os arquivos e faça o projeto funcionar em um emulador
>>>não esqueça de adicionar a dependência (mask_text_input_formatter)

## Classe de conexão
### adicionar as dependências
- são duas, uma do SQFLite e outra do path
- sqflite é a biblioteca para trabalhar com sqlite
- path é o pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).
```cmd
flutter pub add sqflite
flutter pub add path  
```

### crie um arquivo no projeto para o script do bd
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_script.png" alt="Alt text" title="Optional title">


### defina os comandos para criar tabela(s) e registro(s)
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

### criar arquivo no projeto
Para organização, eu criei o arquivo dentro de uma nova pasta "sqlite" em "database" 
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_arquivo.png" alt="Alt text" title="Optional title">

### criar a classe
```dart
class Conexao{

}
```
### definir atributos necessários
- como é um app local para um único usuário, vamos criar uma única conexão... e para isso vamos definir o atributo de database e o de controle 
> como são atributos que serão utilizadas somente na classe, definimos com moficador de acesso privato "-"
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
### uso do static
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
  static Future<Database> criar() async { //como estamos utilizando o await, precisamos tornar a função assíncrona
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

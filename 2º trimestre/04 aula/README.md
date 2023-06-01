## Conteúdo principal: Persistência logal (SQLite)
→ Implementação da classe de conexão; <br>
→ Implementação do DAO SQLite; <br>

### Material de estudo:
[sqflite](https://pub.dev/packages/sqflite) <br>
[path](https://pub.dev/packages/path) <br>
[Persistência local - balta.io](https://balta.io/blog/flutter-sqlite) <br>
[Persistência local - macoratti](https://www.macoratti.net/19/08/flut_accsqlite1.htm) <br>

## Diário de Aula
 - Descrever os pontos principais da classe de conexão (padrão utilizado, cuidados necessários, como funciona e como utilizar);
 - Descrever os pontos principais da classe DAO (padrão utilizado, cuidados necessários, como funciona e como utilizar);

## Desenvolvimento do Projeto
- Implementar o SQLite no seu projeto.

# Aula
>>>baixe os arquivos e faça o projeto funcionar em um emulador
>>>não esqueça de adicionar a dependência (mask_text_input_formatter)

[Passo 01 - implementação da classe de conexão](projeto/inicial/aula/conexao/readme.md) <br>
[Passo 02 - implementação da classe DAO](projeto/inicial/aula/dao/readme.md) <br>

Passo 03 - altere o dao utilizado<br>
→ Na lista
```dart
class _ContatoListaState extends State<ContatoLista> {
  ContatoInterfaceDAO dao = ContatoDAOSQLite();
  [...]
}
```
→ No form<br>
```dart
class _ContatoFormState extends State<ContatoForm> {
  @override
  Widget build(BuildContext context){
    [...]
  }
  
  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        [...]
          ContatoInterfaceDAO dao = ContatoDAOSQLite(); //<<<<<<<<<<<<<<<
  }
}
```

## Possíveis erros
→ Erro na escrita do script, no qual, irá gerar:<br>
```cmd
E/SQLiteLog( 8492): near "CREATEu": syntax error in "indicará o comando errado"
```
Na primeira execução ele roda a criação da tabela e por algum motivo gera um erro na inserção das linhas.<br>
Como ele já rodou a primeira vez, por mais que corrija o script ele não irá executá-lo novamente.
Assim, para que rode novamente, podemos excluir o database
```dart
static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  
      deleteDatabase(path);                                    // >>>excluíndo database
      _database = await openDatabase(                
        path,                                         
        version: 1,                                    
        onCreate: (db, v){                            
          db.execute(criarContato);
          insercoesContato.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
```



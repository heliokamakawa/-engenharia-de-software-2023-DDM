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

[Aula 01 - implementação da classe de conexão](projeto/inicial/aula/conexao/readme.md) <br>
[Aula 02 - implementação da classe DAO](projeto/inicial/aula/dao/readme.md) <br>

altere o dao utilizado na lista
```dart
class _ContatoListaState extends State<ContatoLista> {
  ContatoInterfaceDAO dao = ContatoDAOSQLite();
  [...]
}
```
altere o dao utilizado no form
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



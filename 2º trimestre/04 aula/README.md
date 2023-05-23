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

Aula
baixe os arquivos e faça o projeto funcionar em um emulador
não esqueça de adicionar a dependência
'''
flutter pub add mask_text_input_formatter
'''
Classe de conexão
1ª passo - adicionar as dependências
- são duas, uma do SQFLite e outra do path
- sqflite é a biblioteca para trabalhar com sqlite
- path é o pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).
'''
flutter pub add sqflite
flutter pub add path  
'''

2ª passo - criar arquivo no projeto
Para organização, eu criei o arquivo dentro de uma nova pasta "sqlite" em "database" 
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_arquivo.png" alt="Alt text" title="Optional title">

3ª passo - criar a classe

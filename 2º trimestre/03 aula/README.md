Objetivo app:
- passagem de parâmetros entre widgets
 - definindo a lógica de alterar;
 - definindo a lógica de detalhes;
- lista reativa - alterações dinâmicas;

Material de estudo:
- Passagem de argumento pela rota nomeada: https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
- StatelessWidget e StatefullWidget
 - https://www.youtube.com/watch?v=F5BH0neglbc
 - 

formulário reativo → https://pub.dev/packages/reactive_forms → https://morioh.com/p/66a3491516d1
Lista → https://api.flutter.dev/flutter/widgets/ListView-class.html
Item da Lista → https://api.flutter.dev/flutter/material/ListTile-class.html?gclid=Cj0KCQjwpPKiBhDvARIsACn-gzCOmlEkpiegHYJQAgCKlV-kmPDlbpzxYDF7bgm0Bkn-tm8jdN3re5EaAhX5EALw_wcB&gclsrc=aw.ds
Classes abstratas e interfaces → https://flutterbyexample.com/lesson/abstract-classes-and-interfaces
onTap e ListTile → https://www.youtube.com/watch?v=sZBJun7oU-o
programação assíncrona; await, async, Future, delayed, Duration (onde e quando utilizar). → vídeo aula - https://www.youtube.com/watch?v=Qa7zno-2SFw
DAO → https://www.youtube.com/watch?v=mCoqJPal7Zk
Roteiro de Aula

baixar o projeto e executar no EMULADOR → https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/tree/main/2%C2%BA%20trimestre/03%20aula/projeto%20aula/projeto%20inicial
- Já escolha um computador em que o emulador e o projeto estaja executando!!!
- reveja o código do projeto e relembre a lógica;
- rever o DAO - alterações com interação de dados; 

- definindo a lista reativa (statefull);
- definindo o formulário reativo (statefull);

- definindo passagem de parâmetro (arguments) em rota nomeada;
- recebendo o parâmetro ModalRoute.of(context);
var parametro = ModalRoute.of(context)!.settings.arguments;
    if(parametro != null){
      var contato = parametro as Contato;
      preencherCampos(contato);
    } 
- associando o parâmetro recebindo nos campos; 
- chamada do método alterar do DAO;

@@@@ Atividade I 
- implemente o widget detalhes;


@@@@ Diário de Aula
- Implemente pelo menos 3 formulários, 3 listas e 3 detalhes do seu projeto.

@@@@ Projeto
- Faça a impelemntação do conteúdo corrente no seu projeto.


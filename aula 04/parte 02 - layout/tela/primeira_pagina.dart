import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget{
  const PrimeiraPagina({Key? key}) : super(key: key);
  /*
  Alinhamento e tamanho
  Para alinhar algo,sempre é necessário ter uma referência! Por que?
  Quando o Pai ("recipiente") tiver o mesmo tamanho do filho:
   - não faz sentido tentar posicionar o filho? Por que?

  Todas as exibições dentro de um layout devem ter posição (x,p) e tamanho (largura, altura).
  → Assim, largura e a altura não funciona em   widget (exemplo: container) interno se o 
  externo não tiver o alinhamento - não consegue obter a posição para desenhar...

  Container 
  >>>>Container irá dimensionar-se com base no tamanho de seu filho.
  → Quando não tem direcionamento, ocupa todo o espaço existente
  Propriedades: alignment, width, height  
  */

  @override
  Widget build(BuildContext context){
    /*
    pai - azul (blue)
    filho - cinza (gray)
    neto - vermelho (red)
    */
    return layout01();
  }

  Widget layout01(){
    return Container(
      color: Colors.blue,
      child: Container( 
        color: Colors.grey,
        child: Container( 
          color: Colors.red,
        )
      ),
    );

    /*
    1) Explique o resultado!!!
    2) Sem executar, somente analisando o código, responda:
      - Se definirmos o tamanho somente do neto, altera o resultado?
      - Se definirmos o tamanho somente no filho, altera o resultado?
      - Se definirmos o tamanho somente no pai, altera o resultado?
    3) Implemente, faça os testes, veja o resultado e informe se acertou/errou com as devidas justificativas. 
    */
  }

  Widget layout02(){
    return Container();
    /*
    1) Defina o mesmo exemplo original anterior e defina o alinhamento no pai
    2) Explique o resultado!!!
    3) Sem executar, somente analisando o código, responda:
      - Se definirmos o tamanho (somente) no neto, altera o resultado?
      - Se definirmos o tamanho (somente) no filho, altera o resultado?
      - Se definirmos o tamanho (somente) no pai, altera o resultado?
    4) Implemente, faça os testes, veja o resultado e informe se acertou/errou com as devidas justificativas. 
    */
  }

  Widget layout03(){
    return Container();
    /*
    1) Defina o mesmo exemplo original do layout02.
    2) Sem executar, somente analisando o código, responda:
      - Qual será o resultado, se definirmos o alinhamento somente no filho?
      - Qual será o resultado, se definirmos o alinhamento somente no neto?
      - Qual será o resultado, se definirmos o alinhamento no pai e neto?
      - Qual será o resultado, se definirmos o alinhamento no pai e filho?
      - Qual será o resultado, se definirmos o alinhamento em todos?
    3) Implemente, faça os testes, veja o resultado e informe se acertou/errou com as devidas justificativas. 
    */
  }
}

/*
definir Scaffold c(appBar,body, floatingActionButton,bottomNavigationBar)
prototipar telas do projeto
*/

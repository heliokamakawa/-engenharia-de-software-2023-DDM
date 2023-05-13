import 'package:flutter/material.dart';
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/widget/fotop_contato.dart';
import 'package:persistencia/view/widget/painel_botoes.dart';

class ItemLista extends StatelessWidget {
  final Contato contato;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.contato,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      leading: FotoPContato(contato: contato),
      title: Text(contato.nome),
      subtitle: Text(contato.telefone),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}
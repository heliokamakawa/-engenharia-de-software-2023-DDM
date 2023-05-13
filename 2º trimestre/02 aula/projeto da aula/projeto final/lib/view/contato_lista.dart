import 'package:flutter/material.dart';
import 'package:persistencia/database/daofake/contato_dao_fake.dart';
import 'package:persistencia/rota.dart';
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';
import 'package:persistencia/view/widget/item_lista.dart';

class ContatoLista extends StatelessWidget {
  ContatoInterfaceDAO dao = ContatoDAOFake();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Contatos')),
      body: criarLista(context),
      floatingActionButton: criarBotao(context),
      bottomNavigationBar: criarBarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    
    return FutureBuilder(
      future: dao.consultarTodos(),
      builder: (context,AsyncSnapshot<List<Contato>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há contatos...');
        List<Contato> listaContatos = lista.data!;
        return ListView.builder(
          itemCount: listaContatos.length,
          itemBuilder: (context, indice) {
            var contato = listaContatos[indice];
            return criarItemLista(context, contato);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Contato contato){
    return ItemLista(
      contato: contato, 
      alterar: () => Navigator.pushNamed(context, Rota.contatoForm), 
      detalhes: ()=> Navigator.pushNamed(context, Rota.contatoDetalhe), 
      excluir: ()=> dao.excluir(contato.id)
    );
  }

  BottomAppBar criarBarraNavegacao(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}
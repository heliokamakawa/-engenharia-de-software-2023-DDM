import 'package:flutter/material.dart';
import 'package:persistencia/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:persistencia/rota.dart';
import 'package:persistencia/view/dto/cidade.dart';
import 'package:persistencia/view/interface/cidade_interface_dao.dart';
import 'package:persistencia/view/widget/barra_navegacao.dart';
import 'package:persistencia/view/widget/botao_adicionar.dart';
import 'package:persistencia/view/widget/painel_botoes.dart';

class CidadeLista extends StatefulWidget {
  const CidadeLista({Key? key}) : super(key: key);

  @override
  State<CidadeLista> createState() => _CidadeListaState();
}

class _CidadeListaState extends State<CidadeLista> {
  CidadeInterfaceDAO dao = CidadeDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Cidades')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(acao: ()=> Navigator.pushNamed(context, Rota.contatoForm).then((value)=>buscarCidades())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarCidades(),
      builder: (context,AsyncSnapshot<List<Cidade>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há Cidades...');
        List<Cidade> listaCidades = lista.data!;
        return ListView.builder(
          itemCount: listaCidades.length,
          itemBuilder: (context, indice) {
            var contato = listaCidades[indice];
            return criarItemLista(context, contato);
          },
        );
      },
    );
  }

  Future<List<Cidade>> buscarCidades(){
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Cidade cidade){
    return ItemLista(
      cidade: cidade, 
      alterar: () {
        Navigator.pushNamed(context, Rota.contatoForm, arguments: cidade).then((value) => buscarCidades()); 
      },
      detalhes: (){
        Navigator.pushNamed(context, Rota.contatoDetalhe, arguments: cidade);
      }, 
      excluir: (){
        dao.excluir(cidade.id);
        buscarCidades();
      } 
    );
  }
}

class ItemLista extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.cidade,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      title: Text(cidade.nome),
      subtitle: Text(cidade.estado.nome),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}

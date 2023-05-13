import 'package:flutter/material.dart';
import 'package:persistencia/database/daofake/contato_dao_fake.dart';
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';
import 'package:persistencia/view/widget/campo_email.dart';
import 'package:persistencia/view/widget/campo_nome.dart';
import 'package:persistencia/view/widget/campo_telefone.dart';
import 'package:persistencia/view/widget/campo_url.dart';

class ContatoForm extends StatelessWidget{
  ContatoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        child: Column( 
          children: [
            campoNome,
            campoTelefone,
            campoEmail,
            campoURL,
            criarBotao(context),
          ],
        )
      )
    );
  }

  var campoNome = CampoNome();
  var campoTelefone = CampoTelefone();
  var campoEmail = CampoEmail();
  var campoURL = CampoURL();

  ElevatedButton criarBotao(BuildContext context){
    return ElevatedButton( 
      child: const Text('ok'),
      onPressed: () {
         acaoBotao(context);
      },
    );
  }

  void acaoBotao(BuildContext context){
    var form = Form.of(context);
    if(form != null){
      if(form.validate()){
        var  contato = preencherDTO();
        ContatoInterfaceDAO dao = ContatoDAOFake(); 
        dao.salvar(contato);
        Navigator.pop(context);
      }
    }
  }

  Contato preencherDTO(){
    return Contato(
      nome: campoNome.controle.text,
      email: campoEmail.controle.text,
      telefone: campoTelefone.controle.text,
      urlAvatar: campoURL.controle.text
    );
  }

  void preencherCampos(Contato contato){
    campoNome.controle.text = contato.nome;
    campoEmail.controle.text = contato.email;
    campoTelefone.controle.text = contato.telefone;
    campoURL.controle.text = contato.urlAvatar;
  }
}
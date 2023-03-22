import 'package:flutter/material.dart';
import 'package:aula_layout/tela/primeira_pagina.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Aula',
      home: PrimeiraPagina()
    );
  }
}

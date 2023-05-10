import 'package:aula_layout/tela/tela_basica.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Aula',
      home: TelaBasica()
    );
  }
}

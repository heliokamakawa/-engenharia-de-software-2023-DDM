
import 'package:flutter/material.dart';
import 'package:persistencia/view/dto/contato.dart';

class FotoPContato extends StatelessWidget {
  final Contato contato;

  const FotoPContato({required this.contato,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = contato.urlAvatar;
    var avatarPadrao = const CircleAvatar(child: Icon(Icons.person));

    return (Uri.tryParse(url)!.isAbsolute) ?
       CircleAvatar(backgroundImage: NetworkImage(url))
        : avatarPadrao;
  }
}
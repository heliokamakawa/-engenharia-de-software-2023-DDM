import 'package:flutter/material.dart';

class PainelBotoes extends StatelessWidget {
  VoidCallback? alterar;
  VoidCallback? excluir;
  
  PainelBotoes({required this.alterar, required this.excluir});

  @override
  Widget build(BuildContext context) {
    return Container( 
        width: 100,
        child: Row(
          children: [ 
            IconButton(onPressed: excluir, icon: const Icon(Icons.delete), color: Colors.red,),
            IconButton(onPressed: alterar, icon: const Icon(Icons.edit), color: Colors.orange,)
          ],
        ),
      );
    
  }
}
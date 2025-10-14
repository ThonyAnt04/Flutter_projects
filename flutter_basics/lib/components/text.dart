import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("Texto Curvado", style: TextStyle(fontStyle: FontStyle.italic),),
        Text("Texto Negrita", 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white, backgroundColor: Colors.blue)),
        Text("Decorator", 
        style: TextStyle(
          decoration: TextDecoration.underline, 
          fontSize: 30, color: Colors.black, 
          decorationColor: Colors.red),)
        ,
        Text("Espaciado entre letras",
        style: TextStyle(
          letterSpacing: 30,
          fontSize: 50
        )),
        Text("Texto largo0000000000000000000000000000000000000000000000000000000000000000000000000",
        style: TextStyle(
          fontSize: 30,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,)
        ,Spacer()
      ],
    );
  }
}
import 'package:flutter/material.dart';

class TextFileExample extends StatelessWidget {
  const TextFileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30,),
        TextField(),
         SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(decoration: InputDecoration(hintText: "Introduce tu gmail",
          border: OutlineInputBorder())),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            //obscureText: true,
            decoration: InputDecoration(
              hintText: "Introduce tu gmail",
              prefixIcon:Icon(Icons.search),
              border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            maxLines: 1,
            maxLength: 8,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Introduce tu contraseña",
              prefixIcon:Icon(Icons.password),
              border: OutlineInputBorder()
            ),
          ),
        )
      ],
    );
  }
}
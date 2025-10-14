import 'package:flutter/material.dart';

class BtnExample extends StatelessWidget {
  const BtnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
    ElevatedButton(
      onPressed: () {
        print("Pulsado normalmente");
      },
      child: Text("I'm a button :)"),
      onLongPress: () {
        print("Pulsado largo");
      },
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
    ),
    OutlinedButton(onPressed: null, child: Text("Outlined")),
    TextButton(onPressed: null, child: Text("TextButton")),
    FloatingActionButton(onPressed: (){}, child: Icon(Icons.add)),
    IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
    Spacer()
      ],
    );
  }
}
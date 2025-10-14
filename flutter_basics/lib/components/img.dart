import 'package:flutter/material.dart';

class ImgExample extends StatelessWidget {
  const ImgExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network("https://upload.wikimedia.org/wikipedia/commons/2/2e/Ronaldo_in_2018.jpg"),
        Image.asset("assets/imgs/kirby.jpg",  height: 100,)
      ]
    );
  }
}
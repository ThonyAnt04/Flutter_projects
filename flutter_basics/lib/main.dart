import 'package:flutter/material.dart';
//import 'package:flutter_basics/components/btn_example.dart';
import 'package:flutter_basics/components/img.dart';
//import 'package:flutter_basics/components/text.dart';
//import //'package:flutter_basics/components/text_field.dart';
// import 'package:flutter_basics/layouts/column.dart';
// import 'package:flutter_basics/layouts/row_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi super App"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.abc))
          ],
        ),
        backgroundColor: Colors.amber,
        body: ImgExample(),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
      ),
    );
  }
}
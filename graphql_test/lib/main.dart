import 'package:flutter/material.dart';
import 'package:graphql_test/colors/search_color.dart';
import 'package:graphql_test/screen/product_screen_results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Products Demo',
      home: const MyHomePage(title: 'Mostrar Productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
        backgroundColor: SearchColor.secondBlack,
      ),
      backgroundColor: SearchColor.accent,
      body: SafeArea(
        child: ProductScreen()
      ),
    );
  }
}

import 'package:countries_demo/country_model.dart';
import 'package:countries_demo/graphql_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Countries Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<CountryModel>? _countries;
final GraphqlService _graphqlService = GraphqlService();

@override
void initState() {
  super.initState();
  _load();
}

void _load() async {
  setState(() => _countries = null);
  _countries = await _graphqlService.getAllCountries();
  setState(() {});
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ),
    body: SafeArea(
      child: _countries == null
          ? Center(child: CircularProgressIndicator())
          : _countries!.isEmpty
              ? Center(child: Text('No Countries'))
              : ListView.builder(
                  itemCount: _countries!.length,
                  itemBuilder: (context, index) {
                    final country = _countries![index];
                    return ListTile(
                      leading: Text(country.emoji, style: TextStyle(fontSize: 24)),
                      title: Text('${country.name} : ${country.capital}'),
                      subtitle: Text('Idioma: ${country.native}'),
                    );
                  },
                ),
    ),
  );
}}
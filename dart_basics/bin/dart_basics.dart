import 'dart:io';

import 'package:dart_basics/dart_basics.dart' as dart_basics;
import 'package:dart_basics/poo.dart';

void main(List<String> arguments) {
  var chocolate = IceCream();
  chocolate.flavor = "Chocolate";
  chocolate.charge();

  //?variables normales
  // var hola, pelota, tennis;
  // hola = "buenos dias";
  // pelota = "nike";
  // tennis = "Adidas";

  //!Variables numéricas
  // int age = 18;
  // int teste = -8;

  // double fact = 23.2;

  // num age = 18;

  //*Variables string
  // String name = "Anthony";
  // String currentAge = "18 años";

  // String fullText = "Soy $name y tengo $currentAge años";

  //?Variables dynamic -> pueden cambiar
  // dynamic example = "ejemplo";
  // example = 90;

  //!Variables fijas
  // final String hola = "buena noche";
  // const String nome2 = "Paquito";

  // //*Conversiones
  // String toNumber = "31";
  // int numbesOk = int.parse(toNumber);

  // String stgAgain = numbesOk.toString();

  // print(stgAgain);

  //!Ejercio1 calcu de edad
  // print("Introduce tu año de nacimiento");
  // String date = stdin.readLineSync()!;
  // int burnAgeInt,actualYear,age;
  // burnAgeInt = int.parse(date);
  // actualYear = 2025;
  // age = actualYear - burnAgeInt;

  // print("Tienes $age años");


   obtenerDatos();


}
Future<void> obtenerDatos() async {
  print('Cargando...');
  await Future.delayed(Duration(seconds: 2)); // simula espera
  print('Datos cargados :)');
}
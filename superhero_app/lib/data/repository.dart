import 'dart:convert';

import 'package:superhero_app/data/model/superhero_reponses.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<SuperheroReponses?> fetchSuperheroInfo(String name) async{
    final response = await http.get(Uri.parse(
      "https://superheroapi.com/api/c89f80dd431e858d4bdc75d146bfcf2f/search/$name"));

      if(response.statusCode == 200){
        var decodedJson = jsonDecode(response.body);
        SuperheroReponses superheroReponse = SuperheroReponses.fromJson(decodedJson);
        return superheroReponse;
      }else{
        return null;
      }

  }
}
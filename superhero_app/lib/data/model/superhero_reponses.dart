import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroReponses {
  final String response;
  final List<SuperheroDetailResponse> result;

  SuperheroReponses({required this.response, required this.result});

  factory SuperheroReponses.fromJson(Map<String, dynamic> json){
    var list = json["results"] as List;
    List<SuperheroDetailResponse> heroList = list.map((hero) => SuperheroDetailResponse.fromJson(hero)).toList();
    return SuperheroReponses(response: json["response"], result: heroList);
  }
}
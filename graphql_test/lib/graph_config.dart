import 'package:graphql_flutter/graphql_flutter.dart';

class GraphConfig{
  static HttpLink httpLink = HttpLink('https://pruebas.puntofavorito.cr/graphql');
  GraphQLClient clientToQuery() => GraphQLClient(
    link: httpLink, 
    cache: GraphQLCache());
}


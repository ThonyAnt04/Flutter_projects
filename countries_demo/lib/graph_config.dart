import 'package:graphql_flutter/graphql_flutter.dart';

class GraphConfig {
  static HttpLink httpLink = HttpLink('https://countries.trevorblades.com/'); 

  GraphQLClient clientToQuery() => GraphQLClient(link: httpLink, cache: GraphQLCache());
}

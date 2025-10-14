import 'package:countries_demo/country_model.dart';
import 'package:countries_demo/graph_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  final GraphConfig graphConfig = GraphConfig();
  late final GraphQLClient client = graphConfig.clientToQuery();

  Future<List<CountryModel>> getAllCountries() async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql("""
            query {
              countries {
                code
                name
                native
                capital
                emoji
                currency
              }
            }
          """),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        print(result.exception.toString());
        return [];
      }

      final countriesData = result.data?['countries'] as List<dynamic>;
      return countriesData.map((c) => CountryModel.fromMap(c)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
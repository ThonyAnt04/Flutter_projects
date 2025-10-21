import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/data/product_response.dart';
import 'package:graphql_test/graph_config.dart';

class GraphqlService {
  final GraphConfig graphConfig = GraphConfig();
  late final GraphQLClient client = graphConfig.clientToQuery();

 Future<List<dynamic>> getAllProducts(String searchTerm) async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql("""
            query Products(\$search: String!) {
              products(search: \$search) {
                total_count
                items {
                  id
                  name
                  stock_status
                  image {
                    url
                  }
                  price {
                    regularPrice {
                      amount {
                        currency
                        value
                      }
                    }
                  }
                }
              }
            }
          """),
          variables: {"search": searchTerm},
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        print(result.exception.toString());
        return [];
      }

      final data = result.data;
      if (data == null) return [];

      final response = ProductResponse.fromJson(data);
      return response.result;
    } catch (e) {
      print('Error en GraphqlService: $e');
      return [];
    }
  }
}


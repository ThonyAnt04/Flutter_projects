import 'package:flutter/material.dart';
import 'package:graphql_test/colors/btnStyles.dart';
import 'package:graphql_test/colors/search_color.dart';
import 'package:graphql_test/data/product_detail_response.dart';
import 'package:graphql_test/screen/favorite_products_screen.dart';
import 'package:graphql_test/screen/product_detail_screen.dart';
import 'package:graphql_test/service/graphql_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GraphqlService service = GraphqlService();
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> savedProducts = [];

  List<ProductDetailResponse> products = [];
  bool isLoading = false;

  Future<void> searchProducts() async {
    setState(() => isLoading = true);
    final results = await service.getAllProducts(controller.text);
    setState(() {
      products = results.cast<ProductDetailResponse>();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            controller: controller,
              decoration: InputDecoration(
                labelText: 'Buscar...', labelStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),color: Colors.white,
                  onPressed: searchProducts,
                ),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => searchProducts(),
            ),
            SizedBox(height: 16),
            searchingProcess(),
            SizedBox(
                height: 60,
                width: 160,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>
                      FavoriteProductsScreen(
                        savedFavoriteProducts: savedProducts
                      )
                    ),
                  );
                  }, style: Btnstyles.btnsUses,
                child: Text("Ver Favoritos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                ),
              ),
          ],
        ),
      );
  }

  Expanded searchingProcess() {
    return Expanded(
      child: isLoading
      ? const Center(child: CircularProgressIndicator()) : products.isEmpty
      ? Center(child: Text('Sin resultados', style: TextStyle(color: Colors.white),),): 
      ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return resultsProducts(product);
        },
      ),
    );
  }

  Card resultsProducts(ProductDetailResponse product) {
    return Card(color: SearchColor.secondBlack,
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => 
        ProductDetailScreen(
          productObtained: product, 
          favoriteProducts: savedProducts,))),
          
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              product.url,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),),
          ),
            title: Text(product.name, style: TextStyle(color: SearchColor.secondary, fontWeight: FontWeight.bold),),
            subtitle: Text(
              '${product.price.toString()} ${product.currency}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
            
        ),
      ),
    );
  }
}
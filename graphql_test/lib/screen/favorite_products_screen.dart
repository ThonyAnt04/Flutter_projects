import 'package:flutter/material.dart';
import 'package:graphql_test/colors/btnStyles.dart';
import 'package:graphql_test/colors/search_color.dart';

class FavoriteProductsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> savedFavoriteProducts;
  const FavoriteProductsScreen({super.key, required this.savedFavoriteProducts});

  @override
  State<FavoriteProductsScreen> createState() => _FavoriteProductsScreenState();
}

class _FavoriteProductsScreenState extends State<FavoriteProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favoritos",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: SearchColor.redVariant,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: SearchColor.secondBlack,


      body: widget.savedFavoriteProducts.isEmpty
          ? const Center(
              child: Text(
                "No hay productos favoritos",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: cardFavoriteProduct(),
            ),
            
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: Btnstyles.btnsUses ,
            child: const Text("Finalizar", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
}

  ListView cardFavoriteProduct() {
    return ListView.builder(
          itemCount: widget.savedFavoriteProducts.length,
          itemBuilder: (context, index) {
            final product = widget.savedFavoriteProducts[index];
            return Card(
                color: SearchColor.primary,
                child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network(
                    product["url"],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),),
                  ),
                  title: Text(product["name"], style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold),),
                  subtitle: Text(
                    '${product["price"].toString()} ${product["currency"]}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ), 
                  trailing: IconButton(
                    icon: const 
                    Icon(
                      Icons.delete, 
                      color: SearchColor.secondary,
                    ),onPressed: () {
                      setState(() {
                        widget.savedFavoriteProducts.remove(product); // elimina el Map completo de la lista
                      });
                    },
                  ),  
                ),
                
              );
          }, 
        );
  }
}
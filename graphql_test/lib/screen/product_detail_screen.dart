import 'package:flutter/material.dart';
import 'package:graphql_test/colors/btnStyles.dart';
import 'package:graphql_test/colors/search_color.dart';
import 'package:graphql_test/data/product_detail_response.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailResponse productObtained;
  final List<Map<String, dynamic>> favoriteProducts;

  const ProductDetailScreen({super.key, required this.productObtained, required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteProducts.any((p) => p["id"] == productObtained.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SearchColor.secondBlack,
        title: Text("Volver", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      iconTheme: IconThemeData(
      color: Colors.white,), 
      ),
      body: imgProduct(isFavorite),
      backgroundColor: SearchColor.accent,
      bottomNavigationBar: btnFinish(context));
  }

  Padding btnFinish(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: Btnstyles.btnsUses,
        child: Text("Finalizar", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white), ),
      ),
      ),
    );
  }
  
  Widget imgProduct(isFavorite) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 750,
      decoration: BoxDecoration(
        color: SearchColor.secondBlack,
        borderRadius: BorderRadius.circular(16), // bordes redondeados
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              productObtained.url,
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Texto
          infoProduct(isFavorite),
        ],
      ),
    ),
  );
}

  Padding infoProduct(isFavorite) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                productObtained.name,
                style: TextStyle(color: SearchColor.secondary,fontSize: 18, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
              ),
              SizedBox(height: 17),
              Text("Id: ${productObtained.id}", style: TextStyle(color: Colors.white,fontSize: 16)),
              SizedBox(height: 17),
              Text("${productObtained.price.toString()} ${productObtained.currency}",
                  style: TextStyle(color: Colors.white,fontSize: 16)),
              SizedBox(height: 17),
              Text(
                productObtained.stockStatus == 'IN_STOCK' ? 'Disponible' : 'Agotado',
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
              SizedBox(height: 17,),
              btnSaveFavorites(isFavorite)
            ],
          ),
        );
  }

  ElevatedButton btnSaveFavorites(isFavorite) {
    return ElevatedButton(
              onPressed: () {
                if(isFavorite){
                  favoriteProducts.removeWhere((p) => p["id"] == productObtained.id);
                }else{
                  favoriteProducts.add({
                    "id": productObtained.id,
                    "name": productObtained.name,
                    "url": productObtained.url,
                    "price": productObtained.price,
                    "currency": productObtained.currency,
                    "state": productObtained.stockStatus
                  });
                }
              },
              style:Btnstyles.btnsUses,
        child: Text("Añadir a favoritos", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white), ),
      );
  }
}
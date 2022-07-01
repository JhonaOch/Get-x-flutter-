

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/models/product.dart';

class GlobalController extends GetxController{

List<Product> _products = [];
Map<String,Product> _favorites = Map();

List<Product> get products => _products;
Map<String,Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    print("GLOBALLL");
    _loadProducs();

  }


 Future<void> _loadProducs()async {
  final String productsString = await rootBundle.loadString('assets/archivo.json');
  _products=(jsonDecode(productsString) as List).map((e) => Product.fromJson(e)).toList();
  print("Productos: ${_products.length}");
    update(['products']);

  }


  onFavorite(int index , bool isFavorite){
   Product product= _products[index];
   product.isFavorite=isFavorite;
    if(isFavorite){
      _favorites[product.name as String]=product;
    }else{
      _favorites.remove(product.name);
    }
    update(['products','favorites']);

  }
}
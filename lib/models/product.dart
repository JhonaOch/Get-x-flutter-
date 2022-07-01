
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.productId,
        this.name,
        this.price,
        this.description,
        this.ratingAvg,
    });

    final int? productId;
    final String? name;
    final double? price;
    final String? description;
    final double? ratingAvg;
    bool isFavorite = false;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["Product ID"],
        name: json["Name"],
        price: json["Price"].toDouble(),
        description: json["Description"],
        ratingAvg: json["Rating Avg"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "Product ID": productId,
        "Name": name,
        "Price": price,
        "Description": description,
        "Rating Avg": ratingAvg,
    };
}

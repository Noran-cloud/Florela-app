//import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    final List<BestSeller> products;
    final List<BestSeller> bestSellers;

    Products({
        required this.products,
        required this.bestSellers,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<BestSeller>.from(json["products"].map((x) => BestSeller.fromJson(x))),
        bestSellers: List<BestSeller>.from(json["bestSellers"].map((x) => BestSeller.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "bestSellers": List<dynamic>.from(bestSellers.map((x) => x.toJson())),
    };
}

class BestSeller {
    final String title;
    final String price;
    final String image;
    final bool isFavorite;

    BestSeller({
        required this.title,
        required this.price,
        required this.image,
        this.isFavorite = false,
    });

    factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        title: json["title"],
        price: json["price"],
        image: json["image"],
        isFavorite: json["isFavorite"]?? false,
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "image": image,
        "isFavorite": isFavorite,
    };
}

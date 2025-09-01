// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
    final List<Peony> tulips;
    final List<Peony> peonies;

    Categories({
        required this.tulips,
        required this.peonies,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        tulips: List<Peony>.from(json["Tulips"].map((x) => Peony.fromJson(x))),
        peonies: List<Peony>.from(json["Peonies"].map((x) => Peony.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Tulips": List<dynamic>.from(tulips.map((x) => x.toJson())),
        "Peonies": List<dynamic>.from(peonies.map((x) => x.toJson())),
    };
}

class Peony {
    final String image;
    final String title;
    final String price;

    Peony({
        required this.image,
        required this.title,
        required this.price,
    });

    factory Peony.fromJson(Map<String, dynamic> json) => Peony(
        image: json["image"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
    };
}

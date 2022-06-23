// To parse this JSON data, do
//
//     final Goods = GoodsFromJson(jsonString);

import 'dart:convert';

Goods goodsFromJson(String str) => Goods.fromJson(json.decode(str));

String goodsToJson(Goods data) => json.encode(data.toJson());

class Goods {
  Goods({
    required this.shoe,
    required this.bag,
  });

  final Good shoe;
  final Good bag;

  factory Goods.fromJson(Map<String, dynamic> json) => Goods(
        shoe: Good.fromJson(json['shoe']),
        bag: Good.fromJson(json['bag']),
      );

  Map<String, dynamic> toJson() => {
        'shoe': shoe.toJson(),
        'bag': bag.toJson(),
      };
}

class Good {
  Good({
    required this.name,
    required this.price,
    required this.popularity,
  });

  final String name;
  final List<int> price;
  final List<double> popularity;

  factory Good.fromJson(Map<String, dynamic> json) {
    final price = List<int>.from(json['price'].map((x) => x));
    final popularity = List<double>.from(json['popularity'].map(
      (x) => x.toDouble(),
    ));
    return Good(
      name: json['name'],
      price: List<int>.from(json['price'].map((x) => x)),
      popularity: List<double>.from(json['popularity'].map(
        (x) => x.toDouble(),
      )),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': List<dynamic>.from(price.map((x) => x)),
        'popularity': List<dynamic>.from(popularity.map((x) => x)),
      };
}

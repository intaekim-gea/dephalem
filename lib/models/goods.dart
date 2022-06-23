// To parse this JSON data, do
//
//     final Goods = GoodsFromJson(jsonString);

import 'dart:convert';

Goods goodsFromJson(String str) => Goods.fromJson(json.decode(str));

String goodsToJson(Goods data) => json.encode(data.toJson());

class Goods {
  Goods({
    required this.shoe,
    required this.pokemon,
    required this.favorites,
  });

  final Good shoe;
  final Good pokemon;
  final List<Good> favorites;

  factory Goods.fromJson(Map<String, dynamic> json) => Goods(
        shoe: Good.fromJson(json['shoe']),
        pokemon: Good.fromJson(json['pokemon']),
        favorites: List<Good>.from(
          json['favorites'].map((x) => Good.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'shoe': shoe.toJson(),
        'pokemon': pokemon.toJson(),
        'favorites': List<dynamic>.from(favorites.map((x) => x.toJson())),
      };
}

class Good {
  Good({
    required this.name,
    required this.price,
    required this.popularity,
  });

  final String name;
  final List<double> price;
  final List<double> popularity;

  factory Good.fromJson(Map<String, dynamic> json) => Good(
        name: json['name'],
        price: List<double>.from(json['price'].map((x) => x)),
        popularity: List<double>.from(json['popularity'].map(
          (x) => x.toDouble(),
        )),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': List<dynamic>.from(price.map((x) => x)),
        'popularity': List<dynamic>.from(popularity.map((x) => x)),
      };
}

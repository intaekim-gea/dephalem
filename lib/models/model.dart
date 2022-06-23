// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.size,
    required this.prediction,
  });

  final String name;
  final int size;
  final String prediction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        size: json["size"],
        prediction: json["prediction"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "size": size,
        "prediction": prediction,
      };
}

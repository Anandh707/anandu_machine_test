// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

RandomDog dogFromJson(String str) => RandomDog.fromJson(json.decode(str));

String dogToJson(RandomDog data) => json.encode(data.toJson());

class RandomDog {
  String? message;
  String? status;
  int? price;

  RandomDog({
    this.message,
    this.status,
    this.price,
  });

  factory RandomDog.fromJson(Map<String, dynamic> json) => RandomDog(
        message: json["message"],
        status: json["status"],
        price: Random().nextInt(100) + 50,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}

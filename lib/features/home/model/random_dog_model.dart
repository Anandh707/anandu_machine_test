// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';

RandomDog dogFromJson(String str) => RandomDog.fromJson(json.decode(str));

String dogToJson(RandomDog data) => json.encode(data.toJson());

class RandomDog {
  String? message;
  String? status;

  RandomDog({
    this.message,
    this.status,
  });

  factory RandomDog.fromJson(Map<String, dynamic> json) => RandomDog(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}

// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:interview1/model.dart';

// class Apiservice {
//   Dio dio = Dio(BaseOptions(baseUrl: ""));

//   getpost() async {
//     try {
//       Response response = await dio.get("");
//       if (response.statusCode == 200) {
//         String json = jsonEncode(response.data);
//         return dogFromJson(json);
//       }
//     } catch (e) {
//       log("$e:error");
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:interview1/features/home/model/random_dog_model.dart';

class Apiservice {
  Dio dio = Dio(BaseOptions(baseUrl: "https://dog.ceo/api/breeds/image/"));
  Future<RandomDog?> getpost() async {
    try {
      Response response = await dio.get("random");
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return dogFromJson(json);
      }
    } catch (e) {
      log("$e:message");
    }
    return null;
  }
}

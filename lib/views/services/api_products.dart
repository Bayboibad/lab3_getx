// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:dio/dio.dart';
import 'package:lab3_getx/views/models/producs.dart';

class ApiProduct {
  Future<List<Products>> getAll(int count) async {
    var response = await Dio().get("https://dummyjson.com/products?limit=$count");
    
    if (response.statusCode == 200) {
      final jsonList = response.data["products"] as List;
      var result =  jsonList.map((json) => Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        thumbnail: json['thumbnail'],
      )).toList();
      // ignore: avoid_print
      print("object: ${result}");
      return result;
    } else {
      throw "Lỗi khi gọi API: ${response.statusCode}";
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fakeapi/models/Product_Model.dart';

class Api {
  //////////////// get
  get({required String link}) async {
    Uri url = Uri.parse(link);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code : ${response.statusCode}");
    }
  }

//////////////// add
  post(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      String? token}) async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    Map<String, String>? headrs = {
      "Accept": "application/json", //نوع البيانات الي بستقبلها
      "Content-Type":
          "application/x-www-form-urlencoded" // نوع البيانات الي ببعتها
    };
    if (token != null) {
      headrs.addAll(
        {"Authorization": "Bearer ${token}"},
      );
    }
    http.Response response = await http.post(url,
        body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category
        },
        headers: headrs);
    print(response.body);
    Map data = jsonDecode(response.body);
    return ProductModel.fromjson(data);
  }

//////////////// update
  Future<ProductModel> put(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      String? token}) async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    Map<String, String>? headrs = {
      "Content-Type":
          "application/x-www-form-urlencoded" // نوع البيانات الي ببعتها
    };
    //التوكين دا لوعايز ابعت حاجه محتاحه صلاخيه مش اي حد يقدر يعدل عليها
    if (token != null) {
      headrs.addAll(
        {"Authorization": "Bearer ${token}"},
      );
    }
    http.Response response = await http.post(url,
        body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category
        },
        headers: headrs);
    print(response.body);
    Map data = jsonDecode(response.body);
    return ProductModel.fromjson(data);
  }
}

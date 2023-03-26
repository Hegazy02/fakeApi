import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fakeapi/models/Product_Model.dart';

class Api {
  //////////////// get
  get({required String link}) async {
    Uri url = Uri.parse(link);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "there is a problem with status code : ${response.statusCode}");
      }
    } catch (e) {
      print("get error :$e");
    }
  }

//بنكتب الهيدرز لو عايزين نبعت بيانات للباك اند  post - put - patch....

//////////////// add
  Future<ProductModel> post(
      {required String title,
      required final price,
      required String description,
      required String image,
      required String category,
      String? token}) async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");

    print(
        "title :$title, price :$price, description :$description, image :$image, category :$category");

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
          "category": category,
        },
        headers: headrs);
    Map data = jsonDecode(response.body);
    print("@@@@@@@@@data $data");
    return ProductModel.fromjson(data);
  }

//////////////// update بتبدل البيانات القديمه كلها بالجديده
  put(
      {String? title,
      final price,
      String? description,
      String? image,
      String? category,
      required int id,
      String? token}) async {
    print(
        "title :$title, price :$price, description :$description, image :$image, category :$category, id :$id,");
    Uri url = Uri.parse("https://fakestoreapi.com/products/$id");
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
    http.Response response = await http.put(url,
        body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category
        },
        headers: headrs);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      print("@@@@@@@@@@@@data $data");
      return data;
    } else {
      throw Exception(
          "###################ther is an error with status code :${response.statusCode}");
    }
  }
}

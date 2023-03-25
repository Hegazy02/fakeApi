import 'dart:core';
import 'package:fakeapi/Helpers/API.dart';

class AllCategoriesService {
  Future<List> getAllCategories() async {
    List allCategories =
        Api().get(link: "https://fakestoreapi.com/products/categories");

    return allCategories;
  }
}

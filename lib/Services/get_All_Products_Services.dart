import 'package:fakeapi/Helpers/API.dart';
import 'package:fakeapi/models/Product_Model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List data = await Api().get(link: "https://fakestoreapi.com/products");
    List<ProductModel> produtsList = [];
    data.forEach((element) {
      produtsList.add(ProductModel.fromjson(element));
    });
    return produtsList;
  }
}

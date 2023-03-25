import 'package:fakeapi/Helpers/API.dart';
import 'package:fakeapi/models/Product_Model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getAllProducts(
      {required String categoryName}) async {
    List data = Api()
        .get(link: "https://fakestoreapi.com/products/category/$categoryName");
    List<ProductModel> produtsList = [];
    data.forEach((element) {
      produtsList.add(ProductModel.fromjson(element));
    });
    return produtsList;
  }
}

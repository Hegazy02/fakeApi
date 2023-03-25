// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class testModel {
//   final String id;
//   final price;
//   final String image;
//   final Rating rating;
//   testModel(
//       {required this.id,
//       required this.price,
//       required this.image,
//       required this.rating});
//   factory testModel.fromjson(jasonData) {
//     return testModel(
//         id: jasonData['id'],
//         price: jasonData['price'],
//         image: jasonData['image'],
//         rating: Rating.fromjson(jasonData['rating']));
//   }
// }

// class Rating {
//   final rate;
//   int count;
//   Rating({required this.rate, required this.count});
//   factory Rating.fromjson(jasonData) {
//     return Rating(rate: jasonData['rate'], count: jasonData['count']);
//   }
// }

// class getAllTest {
//   Future<List<testModel>> getTestfun() async {
//     Uri url = Uri.parse("qwerqw");
//     http.Response response = await http.get(url);
//     if (response.statusCode == 200) {
//       List data = jsonDecode(response.body);
//       List<testModel> listTest = [];
//       data.forEach((value) {
//         listTest.add(testModel.fromjson(value));
//       });
//       return listTest;
//       //لما عملت كلاس للبرودكت عرفت اوصل للداتا الي في الليست بالطريقه دي
//       // listTest[0].image;
//     } else {
//       throw Exception(
//           "there is an Error with status code : ${response.statusCode}");
//     }
//   }
// }

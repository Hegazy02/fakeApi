class ProductModel {
  final int id;
  final String title;
  final price;
  final String description;
  final String image;
  final RatingModel? rating;
  //1
  //كل مقابل ماب هعمل مودل ليها عشان لو افترضنا ان الماب دي جواها متغيرات كتير
  //كدا هضطر اعمل لكل متغير فيهم تعريف في كلاس برودكت مودل ودا مش شيئ صحيح ابدا
  //هيبقا الكود كبير وصعب  القرايه
  //2
  // final DD test;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    this.rating,
    // required this.test
  });
  factory ProductModel.fromjson(jasonData) {
    return ProductModel(
      description: jasonData['description'],
      id: jasonData['id'],
      image: jasonData['image'],
      price: jasonData['price'],
      title: jasonData['title'],
      rating: RatingModel.fromjson(jasonData['rating']),
      //2
      // test: DD(
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'],
      //     jasonData['title'])
      //بدل معمل الطريقه دي وشكلها وحش
      //لا انا هديلو الماب وجوا الكلاس هو الي يدي القيم زي ال RatingModel
    );
  }
}

class RatingModel {
  var rate;
  var count;
  RatingModel({this.rate, this.count});
  factory RatingModel.fromjson(jsonData) {
    jsonData = jsonData == null ? {"rate": 0, "count": 0} : jsonData;
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}

//2
// class DD {
//   final int tt;
//   final int kk;
//   final int aa;
//   final int ss;
//   final int ee;
//   final int rr;
//   final int nn;
//   final int gg;
//   final int vv;

//   DD(this.tt, this.kk, this.aa, this.ss, this.ee, this.rr, this.nn, this.gg,
//       this.vv);
// }

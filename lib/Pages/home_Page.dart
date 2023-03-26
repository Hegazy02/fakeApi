import 'package:fakeapi/Pages/AddOrupdate_Product_Page.dart';
import 'package:flutter/material.dart';
import 'package:fakeapi/Helpers/Api.dart';
import 'package:fakeapi/Helpers/bottomSheet.dart';
import 'package:fakeapi/Services/get_All_Products_Services.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add product"),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addOrUpdateProduct(isAdd: true),
                          settings: RouteSettings(arguments: "")));
                },
                icon: Icon(Icons.add))
          ],
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            FutureBuilder(
                //انا عايز اعمل فنكشن ترجعلي الفيوتشر ليست عشان احطها هنا
                //وكل الي عايز اديهولها هو الليست الي جايه من الابي اي دي وعايزها تكون جوا كلاس
                // فقولنا بدل فنكشن هعملها فاكتوري كونستراكتور ياخد اندكس من الليست الي جايه من الابي اي ونعمل متغيرات نحط فيها القيم الي في الاندكس
                //وبعدين نعمل ليست جديده تاخد القيم الاندكس بتاعت الليست القديمه ونحطهم في الكونتسراكتور بتاعنا والي راجع من الكونست دا يتحط في الليست الجديده كااندكس
                future: AllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addOrUpdateProduct(
                                      isAdd: false,
                                      product: snapshot.data![index],
                                    ),
                                settings: RouteSettings(
                                    arguments: snapshot.data![index]))),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  snapshot.data![index].title.substring(0, 10)),
                              Container(
                                  // height: 200,
                                  // width: 200,
                                  child: Image.network(
                                      snapshot.data![index].image)),
                              Text("price : ${snapshot.data![index].price}")
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}

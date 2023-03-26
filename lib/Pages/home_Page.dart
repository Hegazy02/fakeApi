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
  String? title;
  String? price;
  String? description;
  String? image;
  String? category;
  List proList = [];
  bool isSent = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validation(bool test) async {
    if (formKey.currentState!.validate()) {
      isSent = true;

      try {
        if (test) {
          await Api().post(
            title: title!,
            price: price,
            image: image!,
            description: description!,
            category: category!,
          );
          print("###add Success");
        } else {
          await Api().put(
            id: 1,
            title: title!,
            price: price,
            image: image!,
            description: description!,
            category: category!,
          );
          print("###update Success");
        }
      } catch (e) {
        print("####there is an error here : $e");
      }
    } else {
      print("###Fill the textfields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) => title = val,
                      decoration: InputDecoration(label: Text("title")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the title";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      onChanged: (val) => price = val,
                      decoration: InputDecoration(label: Text("price")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the price";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      onChanged: (val) => description = val,
                      decoration: InputDecoration(label: Text("description")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the description";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      onChanged: (val) => image = val,
                      decoration: InputDecoration(label: Text("image")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the image";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      onChanged: (val) => category = val,
                      decoration: InputDecoration(label: Text("category")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the category";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      print("pressed");
                      await validation(true);
                      if (isSent) {
                        CustombottomSheet(context, setState,
                            title: title!,
                            price: price!,
                            image: image!,
                            category: category!,
                            description: description!);
                      }

                      // proList = await AllProductsService().getAllProducts();
                    },
                    child: Text("Add")),
                ElevatedButton(
                    onPressed: () async {
                      print("pressed");
                      await validation(false);
                      if (isSent) {
                        CustombottomSheet(context, setState,
                            title: title!,
                            price: price!,
                            image: image!,
                            category: category!,
                            description: description!);
                      }

                      // proList = await AllProductsService().getAllProducts();
                    },
                    child: Text("Update")),
              ],
            ),
            FutureBuilder(
                //انا عايز اعمل فنكشن ترجعلي الفيوتشر ليست عشان احطها هنا
                //وكل الي عايز اديهولها هو الليست الي جايه من الابي اي دي وعايزها تكون جوا كلاس
                // فقولنا بدل فنكشن هعملها فاكتوري كونستراكتور ياخد اندكس من الليست الي جايه من الابي اي ونعمل متغيرات نحط فيها القيم الي في الاندكس
                //وبعدين نعمل ليست جديده تاخد القيم الاندكس بتاعت الليست القديمه ونحطهم في الكونتسراكتور بتاعنا والي راجع من الكونست دا يتحط في الليست الجديده كااندكس
                future: AllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            Text(snapshot.data![index].title),
                            Container(
                                height: 200,
                                width: 200,
                                child:
                                    Image.network(snapshot.data![index].image)),
                            Text("price : ${snapshot.data![index].price}")
                          ],
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

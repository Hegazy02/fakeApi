import 'package:fakeapi/Helpers/Api.dart';
import 'package:fakeapi/models/Product_Model.dart';
import 'package:flutter/material.dart';

class addOrUpdateProduct extends StatefulWidget {
  bool isAdd;
  ProductModel? product;
  addOrUpdateProduct({super.key, required this.isAdd, this.product});

  @override
  State<addOrUpdateProduct> createState() => _addOrUpdateProductState();
}

class _addOrUpdateProductState extends State<addOrUpdateProduct> {
  String? title;
  String? price;
  String? description;
  String? image;
  String? category;
  List proList = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validation(bool test) async {
    if (formKey.currentState!.validate()) {
      widget.isAdd = true;
      await Api().post(
        title: title!,
        price: price!,
        image: image!,
        description: description!,
        category: category!,
      );
      try {
        if (test) {
          print("###add Success");
        } else {
          await Api().put(
            id: 1,
            title: title ?? widget.product!.title,
            price: price ?? widget.product!.price,
            image: image ?? widget.product!.image,
            description: description ?? widget.product!.description,
            category: category ?? widget.product!.category,
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
      appBar: AppBar(),
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
                      initialValue:
                          widget.product == null ? null : widget.product!.title,
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
                      keyboardType: TextInputType.number,
                      initialValue: widget.product == null
                          ? null
                          : "${widget.product!.price}",
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
                      initialValue: widget.product == null
                          ? null
                          : widget.product!.description,
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
                      initialValue: widget.product == null
                          ? null
                          : widget.product!.category,
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
                    widget.product == null
                        ? TextFormField(
                            onChanged: (val) => image = val,
                            decoration: InputDecoration(label: Text("image")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the image";
                              } else {
                                return null;
                              }
                            },
                          )
                        : SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(widget.product!.image)),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  validation(widget.isAdd);
                },
                child: Text(widget.isAdd == true ? "Add" : "Update"))
          ],
        ),
      ),
    );
  }
}
